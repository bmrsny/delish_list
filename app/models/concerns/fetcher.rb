require "httparty"

class Fetcher
	include HTTParty
	base_uri 'api.bigoven.com'

	def initialize()
	  @options = {api_key: ENV['BIG_OVEN_KEY'] }
	end

	def single_recipe(id)
		self.class.get("/recipe/#{id.to_s}?api_key=#{ENV["BIG_OVEN_KEY"]}", @options)
	end

	def search_input(keyword) 
			self.class.get("/recipes?title_kw=#{URI.escape(keyword)}&pg=1&rpp=40&api_key=#{ENV['BIG_OVEN_KEY']}", @options)
	end
	
	def search_response(keyword)
		search_by_keyword(keyword)
	end

	def search_by_keyword(keyword)
		response = search_input(keyword)
		if response.parsed_response["RecipeSearchResult"]["Results"] != nil
		 response.parsed_response["RecipeSearchResult"]["Results"]["RecipeInfo"]
		else 
			false
		end
	end

	def fetch_single(id)
		response = single_recipe(id)["Recipe"]
	end

	def fetch_ingredients(id)
		recipe = fetch_single(id)
		#recipe["Recipe"]["Ingredients"]["Ingredients"]
		recipe["Ingredients"]["Ingredient"]
	end
end
