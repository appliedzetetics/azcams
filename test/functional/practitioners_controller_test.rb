require 'test_helper'

class PractitionersControllerTest < ActionController::TestCase
  setup do
    @practitioner = practitioners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practitioners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practitioner" do
    assert_difference('Practitioner.count') do
      post :create, :practitioner => @practitioner.attributes
    end

    assert_redirected_to practitioner_path(assigns(:practitioner))
  end

  test "should show practitioner" do
    get :show, :id => @practitioner
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @practitioner
    assert_response :success
  end

  test "should update practitioner" do
    put :update, :id => @practitioner, :practitioner => @practitioner.attributes
    assert_redirected_to practitioner_path(assigns(:practitioner))
  end

  test "should destroy practitioner" do
    assert_difference('Practitioner.count', -1) do
      delete :destroy, :id => @practitioner
    end

    assert_redirected_to practitioners_path
  end
end
