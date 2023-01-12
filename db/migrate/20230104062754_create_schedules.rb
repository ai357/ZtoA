class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.timestamps

      t.string :employee_name
      t.text :plan
      t.integer :leave_stage
      t.datetime :start_time
    end
  end
end
