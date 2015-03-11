class RecipeService
	attr_reader :connection

	def initialize()
		@connection = Faraday.new(url: "http://api.bigoven.com")
	end

	def search_recipes(keyword)
		connection.get("/recipes?title_kw=#{URI.escape(keyword)}&pg=1&rpp=20&api_key=#{ENV["BIG_OVEN_KEY"]}").body
	end
end
