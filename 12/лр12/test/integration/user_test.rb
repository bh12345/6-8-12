require 'test_helper'

class UserTest < ActionDispatch::IntegrationTest

  test 'calc requires login' do
    post lr_view_path, params: { str: '6 6 7 6 6 28 6 7 9' }
    assert_redirected_to signin_path
  end

  test 'can get root after sign in' do
    post auth_create_url, params: { email: 'test@test.com', password: '6252' }

    get root_path
    assert_response :success
  end

  test 'should create users' do
    old_count = User.count
    post users_path, params: { user: { email: 'hello@user', password: 'goodbyeuser' } }
    new_count = User.count
    assert new_count > old_count
  end

end
