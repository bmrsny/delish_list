class ShoppingList < ActiveRecord::Base
  belongs_to :user
	has_many :shopping_list_ingredients
	has_many :ingredients, through: :shopping_list_ingredients

	def list
		self.ingredients.map do |ingredient|
			"Name: #{ingredient.name}\n #{ingredient.quantity}, #{ingredient.unit}\n"
		end
	end

	def bulk_create_ingredients(ingredient_params)
		ingredient_params.each do |ingredient|
			self.ingredients.create(name: ingredient["Name"], quantity: ingredient["Quantity"], unit: ingredient["Unit"])
		end
	end
end
