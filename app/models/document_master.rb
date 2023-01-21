class DocumentMaster < ApplicationRecord
  
  has_many :documents
end

# == Schema Information
#
# Table name: document_masters
#
#  id         :integer          not null, primary key
#  extra      :string
#  name       :string
#  status     :string
#  submission :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
