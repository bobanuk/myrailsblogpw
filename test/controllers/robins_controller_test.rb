require 'test_helper'

class RobinsControllerTest < ActionController::TestCase
  setup do
    @robin = robins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:robins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create robin" do
    assert_difference('Robin.count') do
      post :create, robin: { content: @robin.content, title: @robin.title }
    end

    assert_redirected_to robin_path(assigns(:robin))
  end

  test "should show robin" do
    get :show, id: @robin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @robin
    assert_response :success
  end

  test "should update robin" do
    patch :update, id: @robin, robin: { content: @robin.content, title: @robin.title }
    assert_redirected_to robin_path(assigns(:robin))
  end

  test "should destroy robin" do
    assert_difference('Robin.count', -1) do
      delete :destroy, id: @robin
    end

    assert_redirected_to robins_path
  end
end
