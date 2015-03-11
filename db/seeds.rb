# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#class Seed
# def initialize
#	build_recipe
#	build_ingredient
#	build_recipe_ingredients
# end
#
# def build_recipe
#	name = ["Kentucky Corn Bread", "Aquatic Key Lime Pie", "Sunrise Breakfast Burritto", "Pork Green Chili", "Tortilla Soup", "Bagel and Lox", "Sad Rice"]
#	description = ["So good it will know your socks off", "Best thing too munch on in the morning", "It will remind you of some home cooking","The perfect treat"]
#	category = ["Brekfast", "Lunch", "Dinner", "Dessert"]
#	subcategory = ["Sweet Treat", "Health Snack", "Spicy", "Low Carbs"]
#	url = ["http://foodies.com", "http://foodjunkie.com", "http://foodkitchenspot.org", "http://healthnut.com"]
#	instructions = [
#									"Simmer for 45 minutes, add ingredient 2. Simmer for 45 for minutes til mushy. Serve hot!",
#									"Mix in a mixing bowl, add flour and water. Cook for 45 minutes till golden brown. Let cool for 10 minutes",
#									"Stir ingredients in a large mixing bowl. Pour into skillet on medium heat. Cook for 20 minutes.",
#									"Put in the oven for 80 minutes on high. Let it pop to perfection. Serve scolding hott!"
#								]
#	30.times do 
#		Recipe.create(title: name.sample,
#									description: description.sample, 
#									category: category.sample, 
#									subcategory: subcategory.sample, 
#									url: url.sample, 
#									instructions: instructions.sample)
#	end
# end
#
# def build_ingredient
#	name = ["Flour", "Shredded Chiken", "Beef", "Romain Lettuce", "Salt", "Water", "Sugar", "Egg(s)", "Corn Meal", "Pork", "Green Chili", "Rice"]
#	quantity = ["0.5", "1", "2", "3", "5", "0.2", "4" ]
#	unit = ["oz", "cn", "tbs"]
#	
#
#	 30.times do
#		 Ingredient.create(name: name.sample, quantity: quantity.sample, unit: unit.sample)
#	 end
# end
#
# def build_recipe_ingredients
#		30.times do 
#			RecipeIngredient.create(recipe_id: rand(1..29), ingredient_id: rand(1..29))
#		end
# end
# 
#end
#
#Seed.new
