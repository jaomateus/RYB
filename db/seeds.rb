# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Site.destroy_all

puts "create user"
user1 = User.create!(email: "patrizgonzalez@gmail.com", password: "123456")
user2 = User.create!(email: "samuel.howard34@gmail.com", password: "123456")
user3 = User.create!(email: "dariagort@gmail.com", password: "123456")
user4 = User.create!(email: "joao@gmail.com", password: "123456")

puts "create site"
site1 = Site.create!(user: User.all.sample, project_name: "A Peace Of Green", description: "A garden with a lot of green plants, not so many flowers. I have a really small backyard.", address: "New York", project_type: "Green garden")
site2 = Site.create!(user: User.all.sample, project_name: "Root To Roses", description: "I have a small backyard with a path in the middle and on the sides a lot of green. I would really love it if the sides of the path are roses to have a romantic garden.", address: "Amsterdam", project_type: "Flower garden")
site3 = Site.create(user: User.all.sample, project_name: "Crazy For Cacti", description: "My project is called Crazy For Cacti and thats because I have a sand area in my backyard. I really love cactus, so I would love to have them in my backyard.", address: "Berlin", project_type: "Special garden")
site4 = Site.create(user: User.all.sample, project_name: "Goodgreen", description: "A garden, save for kids and dogs. But I also want it really green and have a lot of variety.", address: "Paris", project_type: "Green garden")
site5 = Site.create(user: User.all.sample, project_name: "The Free", description: "To watch the squirrels play, to absorb the sweet birdsong as if it were nectar, these are the simple joys of the backyard that is rich in nature.", address: "Tallinn", project_type: "Forrest garden")
site6 = Site.create(user: User.all.sample, project_name: "A Garden By The Sea", description: "My area for my project is really small, a balcony. I live near the sea and I'am curious which plants I can place.", address: "Santorini", project_type: "Balcony garden")
site7 = Site.create(user: User.all.sample, project_name: "Horto dos Barros", description: "Joao's really lovely project, but he knows what he is doing with this project.", address: "Praia da Areia Branca", project_type: "Food Forest")
