require 'test_helper'

class EpisodeContactsControllerTest < ActionController::TestCase
  setup do
    @episode_contact = episode_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episode_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create episode_contact" do
    assert_difference('EpisodeContact.count') do
      post :create, episode_contact: { contacted: @episode_contact.contacted, from_client: @episode_contact.from_client, notes: @episode_contact.notes }
    end

    assert_redirected_to episode_contact_path(assigns(:episode_contact))
  end

  test "should show episode_contact" do
    get :show, id: @episode_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @episode_contact
    assert_response :success
  end

  test "should update episode_contact" do
    put :update, id: @episode_contact, episode_contact: { contacted: @episode_contact.contacted, from_client: @episode_contact.from_client, notes: @episode_contact.notes }
    assert_redirected_to episode_contact_path(assigns(:episode_contact))
  end

  test "should destroy episode_contact" do
    assert_difference('EpisodeContact.count', -1) do
      delete :destroy, id: @episode_contact
    end

    assert_redirected_to episode_contacts_path
  end
end
