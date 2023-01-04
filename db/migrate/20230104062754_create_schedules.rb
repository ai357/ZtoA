class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.timestamps
      
      t.string :name
    end
  end
end
