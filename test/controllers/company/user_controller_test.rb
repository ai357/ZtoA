require "test_helper"

class Company::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_user_index_url
    assert_response :success
  end
end
