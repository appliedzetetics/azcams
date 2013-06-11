require 'test_helper'

class ContactActionsControllerTest < ActionController::TestCase
  setup do
    @contact_action = contact_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_action" do
    assert_difference('ContactAction.count') do
      post :create, contact_action: { description: @contact_action.description }
    end

    assert_redirected_to contact_action_path(assigns(:contact_action))
  end

  test "should show contact_action" do
    get :show, id: @contact_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_action
    assert_response :success
  end

  test "should update contact_action" do
    put :update, id: @contact_action, contact_action: { description: @contact_action.description }
    assert_redirected_to contact_action_path(assigns(:contact_action))
  end

  test "should destroy contact_action" do
    assert_difference('ContactAction.count', -1) do
      delete :destroy, id: @contact_action
    end

    assert_redirected_to contact_actions_path
  end
end
