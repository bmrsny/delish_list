class Recipe < ActiveRecord::Base
	 has_attached_file :image, styles: { medium: "300x300>",
                                      thumb: "100x100>" },
                                      default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	
	def self.service
		@recipe_service ||= Fetcher.new
	end

	def self.search(keyword)
		service.search_by_keyword(keyword).map do |recipe|
			_build_object(recipe)	
		end
	end

	def self.single_recipe(id)
		_build_object(service.fetch_single(id))
	end

	def self._build_object(data)
		OpenStruct.new(data)
	end
end
