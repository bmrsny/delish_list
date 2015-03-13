require 'rails_helper'

RSpec.describe ShoppingList, :type => :model do
	it { should belong_to(:user) }

	it { should have_many(:ingredients) }

	it "should return ingredients list" do
		@shopping_list = ShoppingList.create(shopping_list_attributes)
		@ingredients = @shopping_list.ingredients.create(ingredients_attributes)
		
		expect(@shopping_list.list).to eq(["Name: Egg\n 2.0, oz\n"])
	end

	it "should bulk create ingredients for shopping list" do
		@shopping_list = ShoppingList.create(shopping_list_attributes)
		ingredient = [{
									"Name" => "Brownie",
									"Quantity" => "3",
									"Unit" => "cups"
								 }]
		result = @shopping_list.bulk_create_ingredients(ingredient)
		expect(result).to eq([{"Name"=>"Brownie", "Quantity"=>"3", "Unit"=>"cups"}]) 
	end
end
