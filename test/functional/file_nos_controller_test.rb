require 'test_helper'

class FileNosControllerTest < ActionController::TestCase
  setup do
    @file_no = file_nos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_nos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_no" do
    assert_difference('FileNo.count') do
      post :create, file_no: { file_no: @file_no.file_no }
    end

    assert_redirected_to file_no_path(assigns(:file_no))
  end

  test "should show file_no" do
    get :show, id: @file_no
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_no
    assert_response :success
  end

  test "should update file_no" do
    put :update, id: @file_no, file_no: { file_no: @file_no.file_no }
    assert_redirected_to file_no_path(assigns(:file_no))
  end

  test "should destroy file_no" do
    assert_difference('FileNo.count', -1) do
      delete :destroy, id: @file_no
    end

    assert_redirected_to file_nos_path
  end
end
