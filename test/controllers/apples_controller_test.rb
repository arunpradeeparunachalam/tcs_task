require "test_helper"

class ApplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apple = apples(:one)
  end

  test "should get index" do
    get apples_url
    assert_response :success
  end

  test "should get new" do
    get new_apple_url
    assert_response :success
  end

  test "should create apple" do
    assert_difference('Apple.count') do
      post apples_url, params: { apple: {  } }
    end

    assert_redirected_to apple_url(Apple.last)
  end

  test "should show apple" do
    get apple_url(@apple)
    assert_response :success
  end

  test "should get edit" do
    get edit_apple_url(@apple)
    assert_response :success
  end

  test "should update apple" do
    patch apple_url(@apple), params: { apple: {  } }
    assert_redirected_to apple_url(@apple)
  end

  test "should destroy apple" do
    assert_difference('Apple.count', -1) do
      delete apple_url(@apple)
    end

    assert_redirected_to apples_url
  end
end
