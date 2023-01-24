class AddColumnCompanyId < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :company_id, :integer
  end
end
