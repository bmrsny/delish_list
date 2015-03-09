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
		self.class.get("/recipes?title_kw=#{keyword}&pg=1&rpp=20&api_key=#{ENV['BIG_OVEN_KEY']}", @options)
		#recipes?title_kw=oysters&pg=1&rpp=20&api_key={your-api-key}
	end
end
