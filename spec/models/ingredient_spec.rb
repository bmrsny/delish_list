require 'rails_helper'

RSpec.describe Ingredient, :type => :model do
	it { should have_many(:recipes) }

	it { should have_many(:shopping_lists) }
end
