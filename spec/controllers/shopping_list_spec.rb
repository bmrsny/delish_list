#require 'rails_helper'
#
#RSpec.describe ShoppingList, :type => :model do
#	describe "show#Get" do
#		let(:valid_session) { {} }
#		before(:each) do
#			@user = User.create(provider: "twitter", 
#											  uid: "12345456")
#			allow_any_instance_of(ApplicationController).to receive(:current_user)
#				.and_return(@user)
#				@shopping_list = ShoppingList.create(shopping_list_attributes)
#		end
#
#		it "must have have a user to view the page" do
#			expect(response).to render_template(:show)
#		end
#	end
#end
##it 'renders the page with error' do
##      user = create(:user)
##
##      post :create, session: { email: user.email, password: 'invalid' }
##
##      expect(response).to render_template(:new)
##      expect(flash[:notice]).to match(/^Email and password do not match/)
##    end
##
##
##it "assigns all people as @people" do
##      person = Person.create! valid_attributes
##      get :index, {}, valid_session
##      expect(assigns(:people)).to eq([person])
##    end
##  end
#
