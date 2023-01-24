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
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
