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
require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
