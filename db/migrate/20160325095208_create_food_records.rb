class CreateFoodRecords < ActiveRecord::Migration
  def change
    create_table :food_records do |t|
      t.float :quantity
      t.integer :intake_calories
      t.date :intake_date
      t.foreign_key :user_id

      t.timestamps null: false
    end
  end
end
