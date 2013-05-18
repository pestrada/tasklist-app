class AddStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :string, null: false, default: 'pending'
  end
end
