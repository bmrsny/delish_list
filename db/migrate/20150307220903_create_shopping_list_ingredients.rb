class CreateShoppingListIngredients < ActiveRecord::Migration
  def change
    create_table :shopping_list_ingredients do |t|
      t.references :shopping_list, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :shopping_list_ingredients, :shopping_lists
    add_foreign_key :shopping_list_ingredients, :ingredients
  end
end
