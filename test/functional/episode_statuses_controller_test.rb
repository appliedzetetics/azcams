require 'test_helper'

class EpisodeStatusesControllerTest < ActionController::TestCase
  setup do
    @episode_status = episode_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episode_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create episode_status" do
    assert_difference('EpisodeStatus.count') do
      post :create, :episode_status => @episode_status.attributes
    end

    assert_redirected_to episode_status_path(assigns(:episode_status))
  end

  test "should show episode_status" do
    get :show, :id => @episode_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @episode_status
    assert_response :success
  end

  test "should update episode_status" do
    put :update, :id => @episode_status, :episode_status => @episode_status.attributes
    assert_redirected_to episode_status_path(assigns(:episode_status))
  end

  test "should destroy episode_status" do
    assert_difference('EpisodeStatus.count', -1) do
      delete :destroy, :id => @episode_status
    end

    assert_redirected_to episode_statuses_path
  end
end
