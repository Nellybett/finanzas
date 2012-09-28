require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { account_number: @request.account_number, account_type: @request.account_type, amount: @request.amount, bank: @request.bank, identification: @request.identification, name: @request.name, para: @request.para, reason: @request.reason, request_date: @request.request_date }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    put :update, id: @request, request: { account_number: @request.account_number, account_type: @request.account_type, amount: @request.amount, bank: @request.bank, identification: @request.identification, name: @request.name, para: @request.para, reason: @request.reason, request_date: @request.request_date }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
