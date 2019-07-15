require 'test_helper'

class Frontend::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get frontend_carts_show_url
    assert_response :success
  end

end
