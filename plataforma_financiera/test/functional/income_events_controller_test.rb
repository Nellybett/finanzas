require 'test_helper'

class IncomeEventsControllerTest < ActionController::TestCase
  setup do
    @income_event = income_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_event" do
    assert_difference('IncomeEvent.count') do
      post :create, income_event: {  }
    end

    assert_redirected_to income_event_path(assigns(:income_event))
  end

  test "should show income_event" do
    get :show, id: @income_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_event
    assert_response :success
  end

  test "should update income_event" do
    put :update, id: @income_event, income_event: {  }
    assert_redirected_to income_event_path(assigns(:income_event))
  end

  test "should destroy income_event" do
    assert_difference('IncomeEvent.count', -1) do
      delete :destroy, id: @income_event
    end

    assert_redirected_to income_events_path
  end
end
