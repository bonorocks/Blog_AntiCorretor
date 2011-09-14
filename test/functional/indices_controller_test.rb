require 'test_helper'

class IndicesControllerTest < ActionController::TestCase
  setup do
    @index = indices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create index" do
    assert_difference('Indice.count') do
      post :create, :index => @index.attributes
    end

    assert_redirected_to index_path(assigns(:index))
  end

  test "should show index" do
    get :show, :id => @index.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @index.to_param
    assert_response :success
  end

  test "should update index" do
    put :update, :id => @index.to_param, :index => @index.attributes
    assert_redirected_to index_path(assigns(:index))
  end

  test "should destroy index" do
    assert_difference('Indice.count', -1) do
      delete :destroy, :id => @index.to_param
    end

    assert_redirected_to indices_path
  end
end
