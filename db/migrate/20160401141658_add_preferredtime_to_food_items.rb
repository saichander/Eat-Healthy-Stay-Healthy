class AddPreferredtimeToFoodItems < ActiveRecord::Migration
  def change
    add_column :food_items, :preferred_time, :string
  end
end
