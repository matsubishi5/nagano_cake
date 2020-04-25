require 'test_helper'

class Member::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get member_cart_products_new_url
    assert_response :success
  end

  test "should get create" do
    get member_cart_products_create_url
    assert_response :success
  end

  test "should get index" do
    get member_cart_products_index_url
    assert_response :success
  end

  test "should get edit" do
    get member_cart_products_edit_url
    assert_response :success
  end

  test "should get update" do
    get member_cart_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get member_cart_products_destroy_url
    assert_response :success
  end

  test "should get empty" do
    get member_cart_products_empty_url
    assert_response :success
  end

end
