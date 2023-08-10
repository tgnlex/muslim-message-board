require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do 
    get posts_url
    assert_response :success
    assert_equal "index", @controller.action_name
    assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "Posts", @response.body
  end
end
