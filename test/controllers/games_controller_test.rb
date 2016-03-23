require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
