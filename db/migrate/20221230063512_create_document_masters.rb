class CreateDocumentMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :document_masters do |t|

      t.timestamps
      
      t.string :name
    end
  end
end
