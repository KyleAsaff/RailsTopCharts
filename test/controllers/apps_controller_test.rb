require 'test_helper'

class AppsControllerTest < ActionController::TestCase
  test "should get paid" do
    get :paid
    assert_response :success
    assert_select "title", "Top Paid | App Store"
  end

  test "should get free" do
    get :free
    assert_response :success
    assert_select "title", "Top Free | App Store"
  end

  test "should get top_grossing" do
    get :top_grossing
    assert_response :success
    assert_select "title", "Top Grossing | App Store"
  end

end
