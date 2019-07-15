require 'test_helper'

class V1::OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get v1_order_items_create_url
    assert_response :success
  end

  test "should get update" do
    get v1_order_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get v1_order_items_destroy_url
    assert_response :success
  end

end
