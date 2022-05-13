require "test_helper"

class OrangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orange = oranges(:one)
  end

  test "should get index" do
    get oranges_url
    assert_response :success
  end

  test "should get new" do
    get new_orange_url
    assert_response :success
  end

  test "should create orange" do
    assert_difference('Orange.count') do
      post oranges_url, params: { orange: {  } }
    end

    assert_redirected_to orange_url(Orange.last)
  end

  test "should show orange" do
    get orange_url(@orange)
    assert_response :success
  end

  test "should get edit" do
    get edit_orange_url(@orange)
    assert_response :success
  end

  test "should update orange" do
    patch orange_url(@orange), params: { orange: {  } }
    assert_redirected_to orange_url(@orange)
  end

  test "should destroy orange" do
    assert_difference('Orange.count', -1) do
      delete orange_url(@orange)
    end

    assert_redirected_to oranges_url
  end
end
