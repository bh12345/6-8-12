require 'test_helper'

class Lr9ControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lr9_input_url
    assert_response :success
  end

  test "should get view" do
    get lr9_view_url
    assert_response :success
  end

end
