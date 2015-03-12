require 'rails_helper'

RSpec.describe Fetcher, :type => :model do
	describe "RecipeSearch" do
		VCR.use_cassette("search") do
			
			search = Fetcher.new.search_input("brownies")

			it "returns recipes for brownies" do 
				expect(search.count).to eq(30)
			end
		end
	end
end
