require 'test_helper'

class LrControllerTest < ActionDispatch::IntegrationTest
  

  test "results should be different" do
    post lr_view_url params: { str: '6 6 6 7' };
    result1 = response.parsed_body

    post lr_view_url params: { str: '6 8 8' };
    result2 = response.parsed_body

    assert_not_equal result2, result1

  end

end
