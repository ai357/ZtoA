# == Schema Information
#
# Table name: schedules
#
#  id            :integer          not null, primary key
#  employee_name :string
#  leave_stage   :integer
#  plan          :text
#  start_time    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :integer
#
require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
