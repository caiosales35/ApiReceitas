class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.float :preparation_time, null: false
      t.float :oven_time, null: false
      t.text :ingredients, null: false
      t.text :steps, null: false
      t.string :Image
      t.string :category, null: false

      t.timestamps
    end
  end
end
