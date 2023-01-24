# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  comment_status :integer
#  contents       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :integer
#  employee_id    :integer
#  post_id        :integer
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
