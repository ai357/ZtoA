class Document < ApplicationRecord
  
  belongs_to :document_master
end

# == Schema Information
#
# Table name: documents
#
#  id                 :integer          not null, primary key
#  name               :string
#  submission_status  :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  document_master_id :integer
#  user_id            :integer
#
