class AddRecipeKeyToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_key, :string
  end
end
