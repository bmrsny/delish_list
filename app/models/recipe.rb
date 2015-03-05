class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

#	def self.fetch_single()
#		conn = Fetcher.new()
#		response = conn.single_recipe(1)
#		binding.pry
#	end
end
