require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get root_url params: { str: '6 6 7 6 28 6 6 7', format: 'xml' }
    assert_response :success
  end
end
