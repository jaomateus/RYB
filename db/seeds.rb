# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "nokogiri"
require "open-uri"
require "csv"
require 'faker'

Log.destroy_all
SitePlant.destroy_all
Site.destroy_all
User.destroy_all
# Plant.destroy_all

# PARSING
plant_list = CSV.parse(File.read("db/plant_database/Plant_list_copy.csv"))

plant_list.each do |orig_plant|
  puts "Creating plant #{orig_plant[0]}....."

  # # Create plant
  url = "https://pfaf.org/user/plant.aspx?latinname=#{orig_plant[0]}"
  doc = Nokogiri::HTML(URI.open(url), nil, "utf-8")

  if doc.css('span#ContentPlaceHolder1_lbldisplatinname').text != ""
    latin_name = orig_plant[0]
    # image_url = plant[1]
    common_name = doc.css('span#ContentPlaceHolder1_lblCommanName').text.strip
    physical_characteristics = doc.css('span#ContentPlaceHolder1_lblPhystatment').text.strip
    family = doc.css('span#ContentPlaceHolder1_lblFamily').text.strip
    usa_hardiness = doc.css('span#ContentPlaceHolder1_lblUSDAhardiness').text.strip
    usa_hardiness_low = usa_hardiness[0].to_i
    usa_hardiness_high = usa_hardiness[2].to_i
    habitats = doc.css('span#ContentPlaceHolder1_txtHabitats').text.strip
    range = doc.css('span#ContentPlaceHolder1_lblRange').text.strip
    edibility_rate = doc.css('span#ContentPlaceHolder1_txtEdrating').text.match(/\d/)[0].to_i
    weed_potential = doc.css('span#ContentPlaceHolder1_lblWeedPotential').text.downcase == "yes"
    summary = doc.css('span#ContentPlaceHolder1_txtSummary').text
    physical_characteristics = doc.css('span#ContentPlaceHolder1_lblPhystatment').text
    edible_uses = doc.css('span#ContentPlaceHolder1_txtEdibleUses').text
    medicinal_uses = doc.css('span#ContentPlaceHolder1_txtMediUses').text
    cultivation_details = doc.css('span#ContentPlaceHolder1_txtCultivationDetails').text
    propagation_details = doc.css('span#ContentPlaceHolder1_txtPropagation').text

    # Set soil, humidity and sun values
    values = []
    doc.css('table#ContentPlaceHolder1_tblIcons').children.children.children.children.each do |el|
      values << el.attribute('title').value.downcase
    end

    # Set soil values
    well_drained = values.include?("well drained soil")
    moist_soil = values.include?("moist soil")
    wet_soil = values.include?("wet soil")
    water_plant = values.include?("water plants")

    # Set sun/shade values
    full_sun = values.include?("full sun")
    part_shade = values.include?("part shade")
    full_shade = values.include?("full shade")

    # Set hardiness
    if values.include?("tender")
      hardiness = 1
    elsif values.include?("half hardy")
      hardiness = 2
    elsif values.include?("frost hardy")
      hardiness = 3
    elsif values.include?("fully hardy")
      hardiness = 4
    else
      hardiness = nil
    end

    # Check for plant type
    plant_types = ['shrub', 'tree', 'climber', 'perennial']
    words = physical_characteristics.scan(/\w*[A-Z]\w*[A-Za-z]\w*/)

    plant_type = ""
    if words == ""
      plant_type = plant_types.sample
    else
      words.each do |word|
        word = word.downcase
        if plant_types.include?(word) == true
          plant_type = word
        end
      end
    end

    # Check if it is a NFixer
    n_fixer = physical_characteristics.match(/It can fix Nitrogen./) ? true : false

    # Check if it tolerates maritime exposure
    maritime_exposure = physical_characteristics.match(/The plant can tolerate maritime exposure./) ? true : false

    # Check if tolerates atmospheric polution
    atmospheric_polution = physical_characteristics.match(/It can tolerate atmospheric pollution./) ? true : false

    # Create Plant instance
    plant = Plant.create!({ latin_name: latin_name,
                    summary: summary,
                    family: family,
                    common_name: common_name,
                    physical_characteristics: physical_characteristics,
                    usa_hardiness_low: usa_hardiness_low,
                    usa_hardiness_high: usa_hardiness_high,
                    habitats: habitats,
                    range: range,
                    edibility_rate: edibility_rate,
                    weed_potential: weed_potential,
                    edible_uses: edible_uses,
                    medicinal_uses: medicinal_uses,
                    cultivation_details: cultivation_details,
                    propagation_details: propagation_details,
                    hardiness: hardiness,
                    well_drained: well_drained,
                    moist_soil: moist_soil,
                    wet_soil: wet_soil,
                    water_plant: water_plant,
                    full_sun: full_sun,
                    part_shade: part_shade,
                    full_shade: full_shade,
                    n_fixer: n_fixer,
                    maritime_exposure: maritime_exposure,
                    atmospheric_polution: atmospheric_polution,
                    plant_type: plant_type
    })
    # Add photos to plants from the csv file, store in cloudinary
    file = URI.open(orig_plant[1])
    if file
      plant.photo.attach(io: file, filename: "plant.jpg", content_type: "image/png")
      plant.save
    end
  end
end

puts "Creating user......"
user1 = User.create!(email: "patrizgonzalez@gmail.com",
                     password: "123456",
                     first_name: "Patriz",
                     last_name: "Gonzalez",
                     profession: "Ping Pong master",
                     location: "Amsterdam, The netherlands")
user2 = User.create!(email: "samuel.howard34@gmail.com",
                     password: "123456",
                     first_name: "Samuel",
                     last_name: "Howard",
                     profession: "Ping Pong master",
                     location: "Amsterdam, The netherlands")
user3 = User.create!(email: "dariagort@gmail.com",
                     password: "123456",
                     first_name: "Daria",
                     last_name: "Gort",
                     profession: "Architect",
                     location: "Buenos Aires, Argentina")
user4 = User.create!(email: "jaomateus@gmail.com",
                     password: "123456",
                     first_name: "João",
                     last_name: "Mateus",
                     profession: "Landscape Architect",
                     location: "Lourinhã, Portugal")


# puts "Creating sites......"

# User.all.each do |user|
#   site1 = Site.create!(user: user,
#                       project_name: "Creana Project",
#                       description: "A garden with a lot of green plants, not so many flowers. I have a really small backyard.",
#                       address: "Amsterdam, The netherlands",
#                       project_type: "Green garden",
#                       goals: "Counteract climate change",
#                       project_start_date: "2020-09-08",
#                       atmospheric_polution: "low",
#                       maritime_exposure: false,
#                       soil_type: "wet soil",
#                       soil_ph: "5.8",
#                       usa_hardiness_zone: 8)
#   file = File.open("app/assets/images/sites/timthumb.jpeg")
#   site1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#   site1.save

#   site4 = Site.create(user: user,
#                       project_name: "Goodgreen",
#                       description: "A garden, save for kids and dogs. But I also want it really green and have a lot of variety.",
#                       address: "Évora",
#                       project_type: "Green garden",
#                       goals: "Produce my own vegetables",
#                       project_start_date: "2020-05-21",
#                       atmospheric_polution: "moderate",
#                       maritime_exposure: false,
#                       soil_type: "loamy",
#                       soil_ph: "5.6",
#                       usa_hardiness_zone: 8)
#   file = File.open("app/assets/images/sites/DSC_4233-scaled-2048x1367.jpeg")
#   site4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#   site4.save

#   site6 = Site.create(user: user,
#                       project_name: "Horto dos Barros",
#                       description: "My area for my project is really small, a balcony. I live near the sea and I'am curious which plants I can place.",
#                       address: "Santorini",
#                       project_type: "Balcony garden",
#                       goals: "Make my neighbouthood a greener place",
#                       project_start_date: "2015-03-20",
#                       atmospheric_polution: "low",
#                       maritime_exposure: true,
#                       soil_type: "sandy",
#                       soil_ph: "5.8",
#                       usa_hardiness_zone: 10)
#   file = File.open("app/assets/images/sites/knepp1.jpeg")
#   site6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#   site6.save
# end

# Create site plants and logs
# puts "Creating site-plants and logs"

# Site.all.each do |site|
#   10.times do
#     title = Faker::Quotes::Shakespeare.hamlet_quote
#     description = Faker::Quotes::Chiquito.joke
#     site_plant = SitePlant.create(plant: Plant.all.sample, site: site)
#     Log.create(title: title, description: description)
#   end
# end

# site2 = Site.create!(user: User.all.sample, project_name: "Root To Roses", description: "I have a small backyard with a path in the middle and on the sides a lot of green. I would really love it if the sides of the path are roses to have a romantic garden.", address: "Amsterdam", project_type: "Flower garden", goals: "Regenerate land", project_start_date: "2021-09-08")
# file = File.open("app/assets/images/sites/20210725_072409.jpeg")
# site2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# site2.save

# site3 = Site.create(user: User.all.sample, project_name: "Crazy For Cacti", description: "My project is called Crazy For Cacti and thats because I have a sand area in my backyard. I really love cactus, so I would love to have them in my backyard.", address: "Berlin", project_type: "Special garden", goals: "Conserve biodiversity", project_start_date: "2018-03-25")
# file = File.open("app/assets/images/sites/behang-met-een-groen-bos-in-de-mist_9.jpeg")
# site3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# site3.save

# site5 = Site.create(user: User.all.sample, project_name: "The Free", description: "To watch the squirrels play, to absorb the sweet birdsong as if it were nectar, these are the simple joys of the backyard that is rich in nature.", address: "Tallinn", project_type: "Forest garden", goals: "Create a place for biodiversity", project_start_date: "2015-03-25")
# file = File.open("app/assets/images/sites/forest garden RESIZED_0.jpeg")
# site5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# site5.save


# site7 = Site.create(user: User.all.sample, project_name: "Horto dos Barros", description: "Joao's really lovely project, but he knows what he is doing with this project.", address: "Praia da Areia Branca", project_type: "Food Forest", goals: "Reverse desertification", project_start_date: "2015-03-25")
# file = File.open("app/assets/images/sites/IMG_0376.jpeg")
# site7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# site7.save
