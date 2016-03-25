class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :dob, :date
    add_column :users, :gender, :string
  end
end
