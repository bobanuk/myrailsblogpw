require 'test_helper'

class PhotoavatarsControllerTest < ActionController::TestCase
  setup do
    @photoavatar = photoavatars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photoavatars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photoavatar" do
    assert_difference('Photoavatar.count') do
      post :create, photoavatar: { content: @photoavatar.content, title: @photoavatar.title }
    end

    assert_redirected_to photoavatar_path(assigns(:photoavatar))
  end

  test "should show photoavatar" do
    get :show, id: @photoavatar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photoavatar
    assert_response :success
  end

  test "should update photoavatar" do
    patch :update, id: @photoavatar, photoavatar: { content: @photoavatar.content, title: @photoavatar.title }
    assert_redirected_to photoavatar_path(assigns(:photoavatar))
  end

  test "should destroy photoavatar" do
    assert_difference('Photoavatar.count', -1) do
      delete :destroy, id: @photoavatar
    end

    assert_redirected_to photoavatars_path
  end
end
