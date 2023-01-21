# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  contents    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#  employee_id :integer
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
