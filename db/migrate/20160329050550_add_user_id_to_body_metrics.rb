class AddUserIdToBodyMetrics < ActiveRecord::Migration
  def change
    add_column :body_metrics, :user_id, :foreign_key
  end
end
