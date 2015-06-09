require 'test_helper'

class BobansControllerTest < ActionController::TestCase
  setup do
    @boban = bobans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bobans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boban" do
    assert_difference('Boban.count') do
      post :create, boban: { content: @boban.content, title: @boban.title }
    end

    assert_redirected_to boban_path(assigns(:boban))
  end

  test "should show boban" do
    get :show, id: @boban
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boban
    assert_response :success
  end

  test "should update boban" do
    patch :update, id: @boban, boban: { content: @boban.content, title: @boban.title }
    assert_redirected_to boban_path(assigns(:boban))
  end

  test "should destroy boban" do
    assert_difference('Boban.count', -1) do
      delete :destroy, id: @boban
    end

    assert_redirected_to bobans_path
  end
end
