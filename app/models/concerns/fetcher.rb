class Fetcher
	include HTTParty
	base_uri 'api.bigoven.com'

	def initialize()
	  @options = {api_key: 'dvx763458nvGiC8cM7bHQYCPHT9KK12R' }
	end

	def single_recipe(id)
		@options.merge({id: id.to_s})
		self.class.get("/recipe", @options)
	end

	def users
		self.class.get("/2.2/users", @options)
	end
end
