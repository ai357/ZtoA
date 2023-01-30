class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|

      t.timestamps
      t.integer :company_id
      t.text :message
    end
  end
end
