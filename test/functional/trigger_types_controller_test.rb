require 'test_helper'

class TriggerTypesControllerTest < ActionController::TestCase
  setup do
    @trigger_type = trigger_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trigger_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trigger_type" do
    assert_difference('TriggerType.count') do
      post :create, trigger_type: { is_print: @trigger_type.is_print, is_script: @trigger_type.is_script, name: @trigger_type.name }
    end

    assert_redirected_to trigger_type_path(assigns(:trigger_type))
  end

  test "should show trigger_type" do
    get :show, id: @trigger_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trigger_type
    assert_response :success
  end

  test "should update trigger_type" do
    put :update, id: @trigger_type, trigger_type: { is_print: @trigger_type.is_print, is_script: @trigger_type.is_script, name: @trigger_type.name }
    assert_redirected_to trigger_type_path(assigns(:trigger_type))
  end

  test "should destroy trigger_type" do
    assert_difference('TriggerType.count', -1) do
      delete :destroy, id: @trigger_type
    end

    assert_redirected_to trigger_types_path
  end
end
