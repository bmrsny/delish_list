class Recipe < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	def self.search_by_keyword(keyword)
		conn = Fetcher.new()
		response = conn.search_input(keyword)
		recipe_info = response.parsed_response["RecipeSearchResult"]["Results"]

		#THIS GETS ALL RECIPES TITLES
		#recipe_info = response.parsed_response["RecipeSearchResult"]["Results"]["RecipeInfo"]
		#recipe_info.map do |recipe_hash|
		#	recipe_hash["Title"]
		#end	
	end

	def self.fetch_single(id)
		conn = Fetcher.new()
		response = conn.single_recipe(id)
		#response.parsed_response["Recipe"]["Title"]
	end

	def self.get_title(response)
		response.parsed_response["Recipe"]["Title"]
	end

	def self.get_ingredients(response)
		response.parsed_response["Recipe"][""]
	end

	def self.get_ingredient_names(response)
		response["Recipe"]["Ingredients"]["Ingredient"].map do |ingredient|
			ingredient["Name"]
		end
	end

	#def self.find_or_create_from_big_oven(response)
	#end
end
