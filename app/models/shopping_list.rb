class ShoppingList < ActiveRecord::Base
  belongs_to :user
	has_many :shopping_list_ingredients
	has_many :ingredients, through: :shopping_list_ingredients
end
