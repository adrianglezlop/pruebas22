require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get t21" do
    get :t21
    assert_response :success
  end

end
