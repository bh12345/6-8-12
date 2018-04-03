require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get proxy_output_url params: { str: '6 6 7 6 28 6 6 7', side: 'client_with_xslt'}
    assert_response :success
  end

  test "should return various results" do
    get proxy_output_url params: { str: '6 6 7 6 28 6 6 7', side: 'client_with_xslt' }
    result1 = response.parsed_body

    get proxy_output_url params: { str: '7 6 28 6 6 7', side: 'client_with_xslt' }
    result2 = response.parsed_body

    assert_not_equal result1, result2
  end

  test 'should return XML' do
    get proxy_output_url, params: { str: '6 7 6 6 6 7 6 67 6 7 64836', side: 'client' }
    xml = Nokogiri::XML(response.parsed_body)
    value = xml.search('elem').children.first.text
    assert_equal '6', value
  end

  test 'should return HTML' do
    get proxy_output_url, params: { str: '6 7 6 6 6 7 6 67 6 7 64836', side: 'server' }
    assert_select 'tbody', count: 4
  end

end
