require 'rails_helper'

RSpec.describe ShoppingList, :type => :model do
	it { should belong_to(:user) }

	it { should have_many(:ingredients) }
end
