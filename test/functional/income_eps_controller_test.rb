require 'test_helper'

class IncomeEpsControllerTest < ActionController::TestCase
  setup do
    @income_ep = income_eps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_eps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_ep" do
    assert_difference('IncomeEp.count') do
      post :create, income_ep: {  }
    end

    assert_redirected_to income_ep_path(assigns(:income_ep))
  end

  test "should show income_ep" do
    get :show, id: @income_ep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_ep
    assert_response :success
  end

  test "should update income_ep" do
    put :update, id: @income_ep, income_ep: {  }
    assert_redirected_to income_ep_path(assigns(:income_ep))
  end

  test "should destroy income_ep" do
    assert_difference('IncomeEp.count', -1) do
      delete :destroy, id: @income_ep
    end

    assert_redirected_to income_eps_path
  end
end
