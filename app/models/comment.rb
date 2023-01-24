class Comment < ApplicationRecord

  belongs_to :post, optional: true
  belongs_to :company, optional: true
  belongs_to :employee, optional: true

  enum comment_status: {
    company_comment: 0,
    employee_comment: 1,
  }
end

# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  comment_status :integer
#  contents       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :integer
#  employee_id    :integer
#  post_id        :integer
#
