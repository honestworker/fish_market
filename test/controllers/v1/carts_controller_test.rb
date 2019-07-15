require 'test_helper'

class V1::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get v1_carts_show_url
    assert_response :success
  end

end
