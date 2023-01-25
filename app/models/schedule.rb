class Schedule < ApplicationRecord


enum leave_stage: {
  leave_day: 0, 
  birth_day: 1,
  childcare_leave_1month: 2,
  childcare_leave_3month: 3,
  childcare_leave_5month: 4,
  childcare_leave_7month: 5,
  childcare_leave_9month: 6,
  childcare_leave_11month: 7,
  childcare_leave_last: 8,  #ステータスが育児中に代わる
}

def self.tooltip(stage)
  tooltip_word = {
    "leave_day" => "産前休業",
    "birth_day" => "産後休業",
    "childcare_leave_1month" => "育児休業1ヵ月目",
    "childcare_leave_3month" => "育児休業3ヵ月目",
    "childcare_leave_5month" => "育児休業5ヵ月目",
    "childcare_leave_7month" => "育児休業7ヵ月目",
    "childcare_leave_9month" => "育児休業9ヵ月目",
    "childcare_leave_11month" => "育児休業11ヵ月目",
    "childcare_leave_last" => "育児中"
  }

  tooltip_word[stage]
end

end
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
#
