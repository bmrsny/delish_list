class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :subcategory
      t.string :url
      t.text :instructions

      t.timestamps null: false
    end
  end
end
