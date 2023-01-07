class Document < ApplicationRecord
end

# == Schema Information
#
# Table name: documents
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  document_master_id :integer
#  user_id            :integer
#
