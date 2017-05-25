require 'test_helper'

class FundraisersControllerTest < ActionController::TestCase
  setup do
    @fundraiser = fundraisers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fundraisers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fundraiser" do
    assert_difference('Fundraiser.count') do
      post :create, fundraiser: { description: @fundraiser.description, end_date: @fundraiser.end_date, goal: @fundraiser.goal, owner_id: @fundraiser.owner_id, raised: @fundraiser.raised, start_date: @fundraiser.start_date, type: @fundraiser.type }
    end

    assert_redirected_to fundraiser_path(assigns(:fundraiser))
  end

  test "should show fundraiser" do
    get :show, id: @fundraiser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fundraiser
    assert_response :success
  end

  test "should update fundraiser" do
    patch :update, id: @fundraiser, fundraiser: { description: @fundraiser.description, end_date: @fundraiser.end_date, goal: @fundraiser.goal, owner_id: @fundraiser.owner_id, raised: @fundraiser.raised, start_date: @fundraiser.start_date, type: @fundraiser.type }
    assert_redirected_to fundraiser_path(assigns(:fundraiser))
  end

  test "should destroy fundraiser" do
    assert_difference('Fundraiser.count', -1) do
      delete :destroy, id: @fundraiser
    end

    assert_redirected_to fundraisers_path
  end
end
