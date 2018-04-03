require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get newuser" do
    get signup_url
    assert_response :success
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email } }
    end

    assert_redirected_to user_url(User.last)
  end
end
