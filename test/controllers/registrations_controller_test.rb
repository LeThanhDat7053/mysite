require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url  # Đổi từ registrations_new_url thành new_registration_url
    assert_response :success
  end

  test "should create user" do
    post registrations_url, params: { user: { email_address: "test@example.com", password: "password", password_confirmation: "password" } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.notice", "Welcome, test@example.com!"
  end

  test "should not create user with invalid params" do
    post registrations_url, params: { user: { email_address: "", password: "", password_confirmation: "" } }
    assert_template :new
  end
end
