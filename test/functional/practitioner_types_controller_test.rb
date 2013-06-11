require 'test_helper'

class PractitionerTypesControllerTest < ActionController::TestCase
  setup do
    @practitioner_type = practitioner_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practitioner_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practitioner_type" do
    assert_difference('PractitionerType.count') do
      post :create, :practitioner_type => @practitioner_type.attributes
    end

    assert_redirected_to practitioner_type_path(assigns(:practitioner_type))
  end

  test "should show practitioner_type" do
    get :show, :id => @practitioner_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @practitioner_type
    assert_response :success
  end

  test "should update practitioner_type" do
    put :update, :id => @practitioner_type, :practitioner_type => @practitioner_type.attributes
    assert_redirected_to practitioner_type_path(assigns(:practitioner_type))
  end

  test "should destroy practitioner_type" do
    assert_difference('PractitionerType.count', -1) do
      delete :destroy, :id => @practitioner_type
    end

    assert_redirected_to practitioner_types_path
  end
end
