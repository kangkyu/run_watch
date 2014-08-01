class AddFieldsToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :completed_at, 'datetime'
  end
end
