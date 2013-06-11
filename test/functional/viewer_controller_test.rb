require 'test_helper'

class ViewerControllerTest < ActionController::TestCase
  test "should get session_id:string" do
    get :session_id:string
    assert_response :success
  end

  test "should get table:string" do
    get :table:string
    assert_response :success
  end

  test "should get object_id:integer" do
    get :object_id:integer
    assert_response :success
  end

  test "should get user:references" do
    get :user:references
    assert_response :success
  end

end
