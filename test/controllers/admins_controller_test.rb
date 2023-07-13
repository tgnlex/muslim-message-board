require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do 
    get admins_url
    assert_response :success
  end
end
