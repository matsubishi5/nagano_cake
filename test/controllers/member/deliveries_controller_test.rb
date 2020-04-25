require 'test_helper'

class Member::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_deliveries_index_url
    assert_response :success
  end

  test "should get edit" do
    get member_deliveries_edit_url
    assert_response :success
  end

end
