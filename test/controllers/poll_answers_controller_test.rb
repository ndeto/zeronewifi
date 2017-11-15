require 'test_helper'

class PollAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get poll_answers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get poll_answers_destroy_url
    assert_response :success
  end

end
