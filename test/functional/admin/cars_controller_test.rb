require 'test_helper'

class Admin::CarsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car" do
    assert_difference('Admin::Car.count') do
      post :create, :car => { }
    end

    assert_redirected_to car_path(assigns(:car))
  end

  test "should show car" do
    get :show, :id => admin_cars(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_cars(:one).to_param
    assert_response :success
  end

  test "should update car" do
    put :update, :id => admin_cars(:one).to_param, :car => { }
    assert_redirected_to car_path(assigns(:car))
  end

  test "should destroy car" do
    assert_difference('Admin::Car.count', -1) do
      delete :destroy, :id => admin_cars(:one).to_param
    end

    assert_redirected_to admin_cars_path
  end
end
