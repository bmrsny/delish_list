class AddColumnPhoneNumberToShoppingList < ActiveRecord::Migration
  def change
		add_column :shopping_lists, :phone_number, :string
  end
end
