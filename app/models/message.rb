class Message < ApplicationRecord
  
  belongs_to :company
  
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#
