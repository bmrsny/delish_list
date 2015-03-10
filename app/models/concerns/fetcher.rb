require "httparty"

class Fetcher
	include HTTParty
	base_uri 'api.bigoven.com'

	def initialize()
	  @options = {api_key: ENV['BIG_OVEN_KEY'] }
	end

	def single_recipe(id)
		#@options.merge({id: id.to_s})
		#47725?api_key=dvx763458nvGiC8cM7bHQYCPHT9KK12R
		self.class.get("/recipe/#{id.to_s}?api_key=#{ENV["BIG_OVEN_KEY"]}", @options)
	end

	def search_input(keyword) 
		self.class.get("/recipes?title_kw=#{URI.escape(keyword)}&pg=1&rpp=20&api_key=#{ENV['BIG_OVEN_KEY']}", @options)
		#recipes?title_kw=oysters&pg=1&rpp=20&api_key={your-api-key}
	end

	def search_by_keyword(keyword)
		response = search_input(keyword)
		response.parsed_response["RecipeSearchResult"]["Results"]["RecipeInfo"]
	end

	def fetch_single(id)
		response = conn.single_recipe(id)
		#response.parsed_response["Recipe"]["Title"]
	end

	def search_response(keyword)
		search_by_keyword(keyword)
	end

	def get_recipe_titles_from_search(keyword)
		response = search_response(keyword) 
		response.map do |recipe_hash|
			recipe_hash["Title"]
		end	
	end

	def get_recipe_urls_from_search(keyword)
		response = search_response(keyword) 
		response.map do |recipe_hash|
			recipe_hash["WebURL"]
		end	
	end
end
