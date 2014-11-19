require 'test_helper'

class Admin::TagsControllerTest < ActionController::TestCase
  setup do
    @admin_tag = admin_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_tag" do
    assert_difference('Admin::Tag.count') do
      post :create, admin_tag: {  }
    end

    assert_redirected_to admin_tag_path(assigns(:admin_tag))
  end

  test "should show admin_tag" do
    get :show, id: @admin_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_tag
    assert_response :success
  end

  test "should update admin_tag" do
    patch :update, id: @admin_tag, admin_tag: {  }
    assert_redirected_to admin_tag_path(assigns(:admin_tag))
  end

  test "should destroy admin_tag" do
    assert_difference('Admin::Tag.count', -1) do
      delete :destroy, id: @admin_tag
    end

    assert_redirected_to admin_tags_path
  end
end
