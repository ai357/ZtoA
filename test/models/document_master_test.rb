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
require "test_helper"

class DocumentMasterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
