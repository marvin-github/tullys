require 'test_helper'

class InvoiceHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invoice_history_index_url
    assert_response :success
  end

  test "should get create" do
    get invoice_history_create_url
    assert_response :success
  end

  test "should get new" do
    get invoice_history_new_url
    assert_response :success
  end

  test "should get destroy" do
    get invoice_history_destroy_url
    assert_response :success
  end

end
