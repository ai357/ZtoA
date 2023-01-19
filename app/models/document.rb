class Document < ApplicationRecord
  
  belongs_to :document_master
  belongs_to :employee
  
  enum submission_status: { yet:0, done:1 }
end

# == Schema Information
#
# Table name: documents
#
#  id                 :integer          not null, primary key
#  submission_status  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  document_master_id :integer
#  employee_id        :integer
#
