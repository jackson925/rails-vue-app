require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Auth" do
    get pages_Auth_url
    assert_response :success
  end
end
