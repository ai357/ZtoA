class Notification < ApplicationRecord

  belongs_to :employee, optional: true
  belongs_to :post, optional: true
  belongs_to :company, optional: true

  enum notification_status: {
    comment: 0,
    information: 1,
  }
end

# == Schema Information
#
# Table name: notifications
#
#  id                  :integer          not null, primary key
#  notification_status :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :integer
#  employee_id         :integer
#  post_id             :integer
#
