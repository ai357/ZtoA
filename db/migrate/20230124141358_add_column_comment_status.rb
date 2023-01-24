class AddColumnCommentStatus < ActiveRecord::Migration[6.1]

  def change
    add_column :comments, :comment_status, :integer
  end

end
