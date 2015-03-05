class Recipe < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

#	def self.fetch_single()
#		conn = Fetcher.new()
#		response = conn.single_recipe(1)
#		binding.pry
#	end
end
