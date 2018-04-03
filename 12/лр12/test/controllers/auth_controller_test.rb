require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test 'should get signin' do
    get signin_url
    assert_response :success
  end

  #test 'should get signout' do
  #  get signout_url
  #  assert_response :success
  #end

end
