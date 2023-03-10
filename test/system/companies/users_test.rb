require "application_system_test_case"

class Companies::UsersTest < ApplicationSystemTestCase
  setup do
    @companies_user = companies_users(:one)
  end

  test "visiting the index" do
    visit companies_users_url
    assert_selector "h1", text: "Companies/Users"
  end

  test "creating a User" do
    visit companies_users_url
    click_on "New Companies/User"

    fill_in "Email", with: @companies_user.email
    fill_in "Name", with: @companies_user.name
    fill_in "Password", with: @companies_user.password
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit companies_users_url
    click_on "Edit", match: :first

    fill_in "Email", with: @companies_user.email
    fill_in "Name", with: @companies_user.name
    fill_in "Password", with: @companies_user.password
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit companies_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
