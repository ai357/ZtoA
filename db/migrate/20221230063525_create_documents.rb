class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|

      t.timestamps

      t.integer :user_id
      t.integer :document_master_id
      t.string :name
    end
  end
end
