# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

park_1 = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)
trail_1 = park_1.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
trail_2 = park_1.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
trail_3 = park_1.trails.create!(name: "North dome Trail", difficulty: 3, open: true)
