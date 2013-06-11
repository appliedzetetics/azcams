require 'test_helper'

class TemporaryImportsControllerTest < ActionController::TestCase
  setup do
    @temporary_import = temporary_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temporary_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temporary_import" do
    assert_difference('TemporaryImport.count') do
      post :create, :temporary_import => @temporary_import.attributes
    end

    assert_redirected_to temporary_import_path(assigns(:temporary_import))
  end

  test "should show temporary_import" do
    get :show, :id => @temporary_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @temporary_import
    assert_response :success
  end

  test "should update temporary_import" do
    put :update, :id => @temporary_import, :temporary_import => @temporary_import.attributes
    assert_redirected_to temporary_import_path(assigns(:temporary_import))
  end

  test "should destroy temporary_import" do
    assert_difference('TemporaryImport.count', -1) do
      delete :destroy, :id => @temporary_import
    end

    assert_redirected_to temporary_imports_path
  end
end
