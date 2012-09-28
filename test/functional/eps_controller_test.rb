require 'test_helper'

class EpsControllerTest < ActionController::TestCase
  setup do
    @ep = eps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ep" do
    assert_difference('Ep.count') do
      post :create, ep: { ep_lastname: @ep.ep_lastname, ep_manager_email: @ep.ep_manager_email, ep_manager_name: @ep.ep_manager_name, ep_name: @ep.ep_name, identification: @ep.identification, program: @ep.program }
    end

    assert_redirected_to ep_path(assigns(:ep))
  end

  test "should show ep" do
    get :show, id: @ep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ep
    assert_response :success
  end

  test "should update ep" do
    put :update, id: @ep, ep: { ep_lastname: @ep.ep_lastname, ep_manager_email: @ep.ep_manager_email, ep_manager_name: @ep.ep_manager_name, ep_name: @ep.ep_name, identification: @ep.identification, program: @ep.program }
    assert_redirected_to ep_path(assigns(:ep))
  end

  test "should destroy ep" do
    assert_difference('Ep.count', -1) do
      delete :destroy, id: @ep
    end

    assert_redirected_to eps_path
  end
end
