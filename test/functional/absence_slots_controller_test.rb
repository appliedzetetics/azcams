require 'test_helper'

class AbsenceSlotsControllerTest < ActionController::TestCase
  setup do
    @absence_slot = absence_slots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:absence_slots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create absence_slot" do
    assert_difference('AbsenceSlot.count') do
      post :create, absence_slot: { time_from: @absence_slot.time_from, time_to: @absence_slot.time_to }
    end

    assert_redirected_to absence_slot_path(assigns(:absence_slot))
  end

  test "should show absence_slot" do
    get :show, id: @absence_slot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @absence_slot
    assert_response :success
  end

  test "should update absence_slot" do
    put :update, id: @absence_slot, absence_slot: { time_from: @absence_slot.time_from, time_to: @absence_slot.time_to }
    assert_redirected_to absence_slot_path(assigns(:absence_slot))
  end

  test "should destroy absence_slot" do
    assert_difference('AbsenceSlot.count', -1) do
      delete :destroy, id: @absence_slot
    end

    assert_redirected_to absence_slots_path
  end
end
