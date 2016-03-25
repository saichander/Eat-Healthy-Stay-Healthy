class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :item
      t.float :quantity
      t.integer :calories
      t.string :metrics

      t.timestamps null: false
    end
  end
end
