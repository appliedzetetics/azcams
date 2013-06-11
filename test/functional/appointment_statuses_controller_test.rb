require 'test_helper'

class AppointmentStatusesControllerTest < ActionController::TestCase
  setup do
    @appointment_status = appointment_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointment_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment_status" do
    assert_difference('AppointmentStatus.count') do
      post :create, appointment_status: {  }
    end

    assert_redirected_to appointment_status_path(assigns(:appointment_status))
  end

  test "should show appointment_status" do
    get :show, id: @appointment_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment_status
    assert_response :success
  end

  test "should update appointment_status" do
    put :update, id: @appointment_status, appointment_status: {  }
    assert_redirected_to appointment_status_path(assigns(:appointment_status))
  end

  test "should destroy appointment_status" do
    assert_difference('AppointmentStatus.count', -1) do
      delete :destroy, id: @appointment_status
    end

    assert_redirected_to appointment_statuses_path
  end
end
