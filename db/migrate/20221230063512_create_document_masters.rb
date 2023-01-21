class CreateDocumentMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :document_masters do |t|

      t.timestamps

      t.string :name
      t.string :extra
      t.string :submission
      t.string :status
    end
  end
end
