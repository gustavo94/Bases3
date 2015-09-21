require 'test_helper'

class TrayectoriaControllerTest < ActionController::TestCase
  setup do
    @trayectorium = trayectoria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trayectoria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trayectorium" do
    assert_difference('Trayectorium.count') do
      post :create, trayectorium: { nombre: @trayectorium.nombre }
    end

    assert_redirected_to trayectorium_path(assigns(:trayectorium))
  end

  test "should show trayectorium" do
    get :show, id: @trayectorium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trayectorium
    assert_response :success
  end

  test "should update trayectorium" do
    patch :update, id: @trayectorium, trayectorium: { nombre: @trayectorium.nombre }
    assert_redirected_to trayectorium_path(assigns(:trayectorium))
  end

  test "should destroy trayectorium" do
    assert_difference('Trayectorium.count', -1) do
      delete :destroy, id: @trayectorium
    end

    assert_redirected_to trayectoria_path
  end
end
