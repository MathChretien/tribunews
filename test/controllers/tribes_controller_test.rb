require 'test_helper'

class TribesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tribes_index_url
    assert_response :success
  end

  test "should get show" do
    get tribes_show_url
    assert_response :success
  end

  test "should get new" do
    get tribes_new_url
    assert_response :success
  end

  test "should get create" do
    get tribes_create_url
    assert_response :success
  end

  test "should get edit" do
    get tribes_edit_url
    assert_response :success
  end

  test "should get update" do
    get tribes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tribes_destroy_url
    assert_response :success
  end

end
