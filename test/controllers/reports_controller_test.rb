require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get seguimiento" do
    get :seguimiento
    assert_response :success
  end

end
