require 'test_helper'

class IncomeTnsControllerTest < ActionController::TestCase
  setup do
    @income_tn = income_tns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_tns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_tn" do
    assert_difference('IncomeTn.count') do
      post :create, income_tn: {  }
    end

    assert_redirected_to income_tn_path(assigns(:income_tn))
  end

  test "should show income_tn" do
    get :show, id: @income_tn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_tn
    assert_response :success
  end

  test "should update income_tn" do
    put :update, id: @income_tn, income_tn: {  }
    assert_redirected_to income_tn_path(assigns(:income_tn))
  end

  test "should destroy income_tn" do
    assert_difference('IncomeTn.count', -1) do
      delete :destroy, id: @income_tn
    end

    assert_redirected_to income_tns_path
  end
end
