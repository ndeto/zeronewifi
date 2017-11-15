require 'test_helper'

class StoreCampaignsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get store_campaigns_new_url
    assert_response :success
  end

  test "should get create" do
    get store_campaigns_create_url
    assert_response :success
  end

  test "should get edit" do
    get store_campaigns_edit_url
    assert_response :success
  end

end
