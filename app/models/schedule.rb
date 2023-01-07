class Schedule < ApplicationRecord
end

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
