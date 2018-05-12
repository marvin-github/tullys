require 'test_helper'

class InvoiceStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_status = invoice_statuses(:one)
  end

  test "should get index" do
    get invoice_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_status_url
    assert_response :success
  end

  test "should create invoice_status" do
    assert_difference('InvoiceStatus.count') do
      post invoice_statuses_url, params: { invoice_status: { name: @invoice_status.name } }
    end

    assert_redirected_to invoice_status_url(InvoiceStatus.last)
  end

  test "should show invoice_status" do
    get invoice_status_url(@invoice_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_status_url(@invoice_status)
    assert_response :success
  end

  test "should update invoice_status" do
    patch invoice_status_url(@invoice_status), params: { invoice_status: { name: @invoice_status.name } }
    assert_redirected_to invoice_status_url(@invoice_status)
  end

  test "should destroy invoice_status" do
    assert_difference('InvoiceStatus.count', -1) do
      delete invoice_status_url(@invoice_status)
    end

    assert_redirected_to invoice_statuses_url
  end
end
