require 'test_helper'

class ReturnReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @return_reason = return_reasons(:one)
  end

  test "should get index" do
    get return_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_return_reason_url
    assert_response :success
  end

  test "should create return_reason" do
    assert_difference('ReturnReason.count') do
      post return_reasons_url, params: { return_reason: { description: @return_reason.description, name: @return_reason.name } }
    end

    assert_redirected_to return_reason_url(ReturnReason.last)
  end

  test "should show return_reason" do
    get return_reason_url(@return_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_return_reason_url(@return_reason)
    assert_response :success
  end

  test "should update return_reason" do
    patch return_reason_url(@return_reason), params: { return_reason: { description: @return_reason.description, name: @return_reason.name } }
    assert_redirected_to return_reason_url(@return_reason)
  end

  test "should destroy return_reason" do
    assert_difference('ReturnReason.count', -1) do
      delete return_reason_url(@return_reason)
    end

    assert_redirected_to return_reasons_url
  end
end
