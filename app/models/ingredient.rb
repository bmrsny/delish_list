class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	has_many :shopping_list_ingredients
	has_many :shopping_lists, through: :shopping_list_ingredients
end
