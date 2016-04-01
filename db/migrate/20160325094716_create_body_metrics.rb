class CreateBodyMetrics < ActiveRecord::Migration
  def change
    create_table :body_metrics do |t|
      t.integer :height
      t.integer :weight
      t.float :activity_level
      t.integer :calculated_calories
      t.foreign_key :user_id

      t.timestamps null: false
    end
  end
end
