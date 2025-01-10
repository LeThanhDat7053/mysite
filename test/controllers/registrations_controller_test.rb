require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_registration_path # Helper chính xác
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post user_registration_path, params: { user: { email_address: "test@example.com", password: "password", password_confirmation: "password" } }
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div.notice", "Welcome, test@example.com!"
  end

  test "should not create user with invalid params" do
    assert_no_difference('User.count') do
      post user_registration_path, params: { user: { email_address: "", password: "password" } }
    end
    assert_response :unprocessable_entity
  end
end
