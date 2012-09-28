require 'test_helper'

class EgressesControllerTest < ActionController::TestCase
  setup do
    @egress = egresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:egresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create egress" do
    assert_difference('Egress.count') do
      post :create, egress: { amount: @egress.amount, date: @egress.date, invoice_number: @egress.invoice_number, operation_number: @egress.operation_number, reason: @egress.reason, type_of_payment: @egress.type_of_payment }
    end

    assert_redirected_to egress_path(assigns(:egress))
  end

  test "should show egress" do
    get :show, id: @egress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @egress
    assert_response :success
  end

  test "should update egress" do
    put :update, id: @egress, egress: { amount: @egress.amount, date: @egress.date, invoice_number: @egress.invoice_number, operation_number: @egress.operation_number, reason: @egress.reason, type_of_payment: @egress.type_of_payment }
    assert_redirected_to egress_path(assigns(:egress))
  end

  test "should destroy egress" do
    assert_difference('Egress.count', -1) do
      delete :destroy, id: @egress
    end

    assert_redirected_to egresses_path
  end
end
