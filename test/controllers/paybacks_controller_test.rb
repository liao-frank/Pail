require 'test_helper'

class PaybacksControllerTest < ActionController::TestCase
  setup do
    @payback = paybacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paybacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payback" do
    assert_difference('Payback.count') do
      post :create, payback: { date: @payback.date, payment_id: @payback.payment_id }
    end

    assert_redirected_to payback_path(assigns(:payback))
  end

  test "should show payback" do
    get :show, id: @payback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payback
    assert_response :success
  end

  test "should update payback" do
    patch :update, id: @payback, payback: { date: @payback.date, payment_id: @payback.payment_id }
    assert_redirected_to payback_path(assigns(:payback))
  end

  test "should destroy payback" do
    assert_difference('Payback.count', -1) do
      delete :destroy, id: @payback
    end

    assert_redirected_to paybacks_path
  end
end
