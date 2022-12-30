class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      
      t.integer :user_id
      t.integer :company_id
      t.string :title
      t.string :body
    end
  end
end
