class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :youtube_url

      t.timestamps null: false
    end
  end
end
