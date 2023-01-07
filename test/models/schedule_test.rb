# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  name       :string
#  start_time :datetime
#  to_do      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
