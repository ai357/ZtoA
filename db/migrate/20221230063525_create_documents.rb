class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|

      t.timestamps

      t.integer :employee_id
      t.integer :document_master_id
      t.integer :submission_status
    end
  end
end
