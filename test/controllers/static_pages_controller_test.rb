require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get paid" do
    get :paid
    assert_response :success
  end

  test "should get free" do
    get :free
    assert_response :success
  end

  test "should get top_grossing" do
    get :top_grossing
    assert_response :success
  end

end
