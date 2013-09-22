require 'test_helper'

class SampleSourcesControllerTest < ActionController::TestCase
  setup do
    @sample_source = sample_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sample_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sample_source" do
    assert_difference('SampleSource.count') do
      post :create, sample_source: { description: @sample_source.description, title: @sample_source.title }
    end

    assert_redirected_to sample_source_path(assigns(:sample_source))
  end

  test "should show sample_source" do
    get :show, id: @sample_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sample_source
    assert_response :success
  end

  test "should update sample_source" do
    put :update, id: @sample_source, sample_source: { description: @sample_source.description, title: @sample_source.title }
    assert_redirected_to sample_source_path(assigns(:sample_source))
  end

  test "should destroy sample_source" do
    assert_difference('SampleSource.count', -1) do
      delete :destroy, id: @sample_source
    end

    assert_redirected_to sample_sources_path
  end
end
