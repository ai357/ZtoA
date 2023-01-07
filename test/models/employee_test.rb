# == Schema Information
#
# Table name: employees
#
#  id                     :integer          not null, primary key
#  baby_name              :string
#  birth                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  expected               :string
#  is_deleted             :boolean          default(FALSE), not null
#  name                   :string
#  number                 :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sex                    :string
#  status                 :integer          default("before_leave"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :integer
#
# Indexes
#
#  index_employees_on_email                 (email) UNIQUE
#  index_employees_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
