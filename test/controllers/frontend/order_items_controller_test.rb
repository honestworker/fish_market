require 'test_helper'

class Frontend::OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get frontend_order_items_create_url
    assert_response :success
  end

  test "should get update" do
    get frontend_order_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get frontend_order_items_destroy_url
    assert_response :success
  end

end
