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

# Site.destroy_all

# puts "create user"
# user1 = User.create!(email: "patrizgonzalez@gmail.com", password: "123456")
# user2 = User.create!(email: "samuel.howard34@gmail.com", password: "123456")
# user3 = User.create!(email: "dariagort@gmail.com", password: "123456")
# user4 = User.create!(email: "joao@gmail.com", password: "123456")

# puts "create site"
# site1 = Site.create!(user: User.all.sample, project_name: "A Peace Of Green", description: "A garden with a lot of green plants, not so many flowers. I have a really small backyard.", address: "New York", project_type: "Green garden")
# site2 = Site.create!(user: User.all.sample, project_name: "Root To Roses", description: "I have a small backyard with a path in the middle and on the sides a lot of green. I would really love it if the sides of the path are roses to have a romantic garden.", address: "Amsterdam", project_type: "Flower garden")
# site3 = Site.create(user: User.all.sample, project_name: "Crazy For Cacti", description: "My project is called Crazy For Cacti and thats because I have a sand area in my backyard. I really love cactus, so I would love to have them in my backyard.", address: "Berlin", project_type: "Special garden")
# site4 = Site.create(user: User.all.sample, project_name: "Goodgreen", description: "A garden, save for kids and dogs. But I also want it really green and have a lot of variety.", address: "Paris", project_type: "Green garden")
# site5 = Site.create(user: User.all.sample, project_name: "The Free", description: "To watch the squirrels play, to absorb the sweet birdsong as if it were nectar, these are the simple joys of the backyard that is rich in nature.", address: "Tallinn", project_type: "Forrest garden")
# site6 = Site.create(user: User.all.sample, project_name: "A Garden By The Sea", description: "My area for my project is really small, a balcony. I live near the sea and I'am curious which plants I can place.", address: "Santorini", project_type: "Balcony garden")
# site7 = Site.create(user: User.all.sample, project_name: "Horto dos Barros", description: "Joao's really lovely project, but he knows what he is doing with this project.", address: "Praia da Areia Branca", project_type: "Food Forest")


# PARSING
plant_list = CSV.parse(File.read("Plant_list.csv"))


url = "https://pfaf.org/user/plant.aspx?latinname=#{plant_list[0][0]}"
doc = Nokogiri::HTML(URI.open(url), nil, "utf-8")

if doc.css('span#ContentPlaceHolder1_lbldisplatinname').text != ""
  Plant.new(
    name: doc.css('span#ContentPlaceHolder1_lbldisplatinname').text
  )
else
  p "kjsgfkjghsf"
end

# def parse_html(url)
# doc = Nokogiri::HTML(URI.open(url), nil, "utf-8")



# latin_name = doc.css('span#ContentPlaceHolder1_lbldisplatinname').text.strip
# common_name = doc.css('span#ContentPlaceHolder1_lblCommanName').text.strip
# phisic_charact = doc.css('span#ContentPlaceHolder1_lblPhystatment').text.strip
# plant_family = doc.css('span#ContentPlaceHolder1_lblFamily').text.strip
# usa_hardiness = doc.css('span#ContentPlaceHolder1_lblUSDAhardiness').text.strip
#   hardiness_low = usa_hardiness[0].to_i
#   hardiness_high = usa_hardiness[2].to_i
# habitats = doc.css('span#ContentPlaceHolder1_txtHabitats').text.strip.match(/.*(?=[\[])/)[0] + "."
# range = doc.css('span#ContentPlaceHolder1_lblRange').text.strip
# edibility_rating = doc.css('span#ContentPlaceHolder1_txtEdrating').text.match(/\d/)[0].to_i
# weed_potential = doc.css('span#ContentPlaceHolder1_lblWeedPotential').text
# summary = doc.css('span#ContentPlaceHolder1_txtSummary').text
# physical_characteristics = doc.css('span#ContentPlaceHolder1_lblPhystatment').text
# edible_uses = doc.css('span#ContentPlaceHolder1_txtEdibleUses').text
# medicinal_uses = doc.css('span#ContentPlaceHolder1_txtMediUses').text
# cultivation_details = doc.css('span#ContentPlaceHolder1_txtCultivationDetails').text
# propagation_details = doc.css('span#ContentPlaceHolder1_txtPropagation').text









# p common_name
# p "---------------------------------------------"
# p "---------------------------------------------"
# p phisic_charact
# p "---------------------------------------------"
# p "---------------------------------------------"
# p plant_family
# p "---------------------------------------------"
# p "---------------------------------------------"
# p usa_hardiness
# p hardiness_low
# p hardiness_high
# p "---------------------------------------------"
# p "---------------------------------------------"
# p habitats
# p "--------------------------------------------"
# p "---------------------------------------------"
# p range
# p "---------------------------------------------"
# p "---------------------------------------------"
# p edibility_rating
# p "---------------------------------------------"
# p "---------------------------------------------"
# p weed_potential
# p "---------------------------------------------"
# p "---------------------------------------------"
# p summary
# p "---------------------------------------------"
# p "---------------------------------------------"
# p physical_characteristics
# p "---------------------------------------------"
# p "---------------------------------------------"
# p edible_uses
# p "---------------------------------------------"
# p "---------------------------------------------"
# p medicinal_uses
# p "---------------------------------------------"
# p "---------------------------------------------"
# p cultivation_details

# p propagation_details
