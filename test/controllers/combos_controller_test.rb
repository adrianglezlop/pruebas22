require 'test_helper'

class CombosControllerTest < ActionController::TestCase
  test "should get pais" do
    get :pais
    assert_response :success
  end

  test "should get estado" do
    get :estado
    assert_response :success
  end

  test "should get ciudad" do
    get :ciudad
    assert_response :success
  end

end
