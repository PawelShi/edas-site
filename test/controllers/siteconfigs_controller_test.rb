require 'test_helper'

class SiteconfigsControllerTest < ActionController::TestCase
  setup do
    @siteconfig = siteconfigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:siteconfigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create siteconfig" do
    assert_difference('Siteconfig.count') do
      post :create, siteconfig: { name: @siteconfig.name, value: @siteconfig.value }
    end

    assert_redirected_to siteconfig_path(assigns(:siteconfig))
  end

  test "should show siteconfig" do
    get :show, id: @siteconfig
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @siteconfig
    assert_response :success
  end

  test "should update siteconfig" do
    patch :update, id: @siteconfig, siteconfig: { name: @siteconfig.name, value: @siteconfig.value }
    assert_redirected_to siteconfig_path(assigns(:siteconfig))
  end

  test "should destroy siteconfig" do
    assert_difference('Siteconfig.count', -1) do
      delete :destroy, id: @siteconfig
    end

    assert_redirected_to siteconfigs_path
  end
end
