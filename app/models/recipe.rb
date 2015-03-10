class Recipe < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	def self.find_or_create_from(response_titles, response_url)
		response_titles.each do |title|
			recipe = Recipe.find_or_create_by(title: title)
			recipe.save
		end
		 #add_title(response_titles)
		#add_image_url(response_url)
	end

	#def self.get_title_from_id(response)
	#	response.parsed_response["Recipe"]["Title"]
	#end

	#def self.get_ingredients_id(response)
	#	response.parsed_response["Recipe"][""]
	#end

	#def self.get_ingredient_names_id(response)
	#	response["Recipe"]["Ingredients"]["Ingredient"].map do |ingredient|
	#		ingredient["Name"]
	#	end
	#end

	private

	def add_title(response_titles)
		response_titles.each do |title|
			recipe = Recipe.find_or_create_by(title: title)
			recipe.save
		end
	end

	def add_image_url(response_url)
		response_url.each do |image_url|
			recipe = Recipe.find_or_create_by(image: image_url)
			recipe.save
		end
	end
end
