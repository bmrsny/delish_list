class ChangeIngredientQuantityToFloat < ActiveRecord::Migration
  def change
		change_column :ingredients, :quantity, :float
  end
end
