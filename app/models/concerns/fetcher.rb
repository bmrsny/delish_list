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
			self.class.get("/recipes?title_kw=#{URI.escape(keyword)}&pg=1&rpp=20&api_key=#{ENV['BIG_OVEN_KEY']}", @options)
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
		response = conn.single_recipe(id)
	end

	def create_or_find_recipes(keyword)
			response = search_response(keyword) 
			response.map do |recipe| 
				 new_recipe = Recipe.find_or_create_by(title: recipe["Title"], 
															 	recipe_key: recipe["RecipeID"],
															  image_url: recipe["ImageURL"])
			end
	end
end
