class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|

      t.timestamps
      t.integer :post_id
      t.integer :employee_id
      t.integer :notification_status
    end
  end
end
