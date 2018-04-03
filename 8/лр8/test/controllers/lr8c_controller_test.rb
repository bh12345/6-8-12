require 'test_helper'

class Lr8cControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lr8c_input_url
    assert_response :success
  end


 test "should get 3 for view with 6 34 28 6 54 28 6 6" do
    get lr8c_view_url, params:{str: '6 34 28 6 54 28 6 6'}

    assert_equal assigns[:sizeArr], 3
 end

end
