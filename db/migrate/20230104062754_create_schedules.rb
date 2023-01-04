class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.timestamps

      t.string :name
      t.integer :user_id
      t.text :to_do
      t.datetime :start_time
    end
  end
end
