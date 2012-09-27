require 'test_helper'

class EgressEventsControllerTest < ActionController::TestCase
  setup do
    @egress_event = egress_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:egress_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create egress_event" do
    assert_difference('EgressEvent.count') do
      post :create, egress_event: {  }
    end

    assert_redirected_to egress_event_path(assigns(:egress_event))
  end

  test "should show egress_event" do
    get :show, id: @egress_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @egress_event
    assert_response :success
  end

  test "should update egress_event" do
    put :update, id: @egress_event, egress_event: {  }
    assert_redirected_to egress_event_path(assigns(:egress_event))
  end

  test "should destroy egress_event" do
    assert_difference('EgressEvent.count', -1) do
      delete :destroy, id: @egress_event
    end

    assert_redirected_to egress_events_path
  end
end
