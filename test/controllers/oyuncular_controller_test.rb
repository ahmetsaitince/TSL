require "test_helper"

class OyuncularControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oyuncular_index_url
    assert_response :success
  end

  test "should get show" do
    get oyuncular_show_url
    assert_response :success
  end

  test "should get new" do
    get oyuncular_new_url
    assert_response :success
  end

  test "should get create" do
    get oyuncular_create_url
    assert_response :success
  end

  test "should get edit" do
    get oyuncular_edit_url
    assert_response :success
  end

  test "should get update" do
    get oyuncular_update_url
    assert_response :success
  end

  test "should get destroy" do
    get oyuncular_destroy_url
    assert_response :success
  end
end
