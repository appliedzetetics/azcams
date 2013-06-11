require 'test_helper'

class PrintTemplatesControllerTest < ActionController::TestCase
  setup do
    @print_template = print_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_template" do
    assert_difference('PrintTemplate.count') do
      post :create, print_template: { content: @print_template.content, description: @print_template.description }
    end

    assert_redirected_to print_template_path(assigns(:print_template))
  end

  test "should show print_template" do
    get :show, id: @print_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_template
    assert_response :success
  end

  test "should update print_template" do
    put :update, id: @print_template, print_template: { content: @print_template.content, description: @print_template.description }
    assert_redirected_to print_template_path(assigns(:print_template))
  end

  test "should destroy print_template" do
    assert_difference('PrintTemplate.count', -1) do
      delete :destroy, id: @print_template
    end

    assert_redirected_to print_templates_path
  end
end
