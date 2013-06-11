require 'test_helper'

class PrintQueuesControllerTest < ActionController::TestCase
  setup do
    @print_queue = print_queues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_queues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_queue" do
    assert_difference('PrintQueue.count') do
      post :create, print_queue: { entity: @print_queue.entity, entity_id: @print_queue.entity_id }
    end

    assert_redirected_to print_queue_path(assigns(:print_queue))
  end

  test "should show print_queue" do
    get :show, id: @print_queue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_queue
    assert_response :success
  end

  test "should update print_queue" do
    put :update, id: @print_queue, print_queue: { entity: @print_queue.entity, entity_id: @print_queue.entity_id }
    assert_redirected_to print_queue_path(assigns(:print_queue))
  end

  test "should destroy print_queue" do
    assert_difference('PrintQueue.count', -1) do
      delete :destroy, id: @print_queue
    end

    assert_redirected_to print_queues_path
  end
end
