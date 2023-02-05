class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.timestamps

      t.string :employee_name
      t.integer :employee_id
      t.text :plan
      t.integer :leave_stage
      t.datetime :start_time
    end
  end
end
