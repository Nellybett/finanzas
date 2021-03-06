require 'test_helper'

class TnsControllerTest < ActionController::TestCase
  setup do
    @tn = tns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tn" do
    assert_difference('Tn.count') do
      post :create, tn: { identification: @tn.identification, program: @tn.program, tn_manager_email: @tn.tn_manager_email, tn_manager_name: @tn.tn_manager_name, tn_name: @tn.tn_name, tn_taker: @tn.tn_taker }
    end

    assert_redirected_to tn_path(assigns(:tn))
  end

  test "should show tn" do
    get :show, id: @tn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tn
    assert_response :success
  end

  test "should update tn" do
    put :update, id: @tn, tn: { identification: @tn.identification, program: @tn.program, tn_manager_email: @tn.tn_manager_email, tn_manager_name: @tn.tn_manager_name, tn_name: @tn.tn_name, tn_taker: @tn.tn_taker }
    assert_redirected_to tn_path(assigns(:tn))
  end

  test "should destroy tn" do
    assert_difference('Tn.count', -1) do
      delete :destroy, id: @tn
    end

    assert_redirected_to tns_path
  end
end
