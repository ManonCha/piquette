# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying everything"
Meal.destroy_all
puts 1
Bottle.destroy_all
puts 2
Region.destroy_all
puts 3
Country.destroy_all
puts 4
BottleGrape.destroy_all
puts "yty"
Grape.destroy_all
puts 5
Winery.destroy_all
puts 6
Color.destroy_all
puts 7
User.destroy_all
puts 8
UserBottle.destroy_all
puts 9
WinePairing.destroy_all
puts 10


meal_1 = Meal.create(name:"spagethi bolo")
region_1 = Region.create(name:"vendée")
country_1 = Country.create(name:"france")
grape_1 =  Grape.create(name:"raisin blanc")
winery_1 =  Winery.create(name:"jean-francois le porducteur")
color_1 = Color.create(name:'white')
bottle_1 =  Bottle.create(title:"chateau la tour", region: region_1,country: country_1,winery:winery_1,year:2016,  best_before:14, best_after: 16, color:color_1)
wine_pairings_1 = WinePairing.create(bottle:bottle_1, meal:meal_1)
bottle_grapes_1 = BottleGrape.create(grape:grape_1)
user1= User.create(email:'antoine@gmail.com', password: '123456')
user_bottle_1 = UserBottle.create(quantity: 10, bottle:bottle_1, user:user1)

