class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registrations_new_url
    assert_response :success
  end

  test "should create user" do
    post registrations_create_url, params: { user: { email_address: "test@example.com", password: "password", password_confirmation: "password" } }
    assert_redirected_to root_path
  end
end
