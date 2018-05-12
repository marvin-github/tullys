require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { canine_id: @invoice.canine_id, commission_percent: @invoice.commission_percent, credit_card_last_4: @invoice.credit_card_last_4, customer_id: @invoice.customer_id, invoice_status: @invoice.invoice_status, paper_deliver_method: @invoice.paper_deliver_method, payment_amount_1: @invoice.payment_amount_1, payment_amount_2: @invoice.payment_amount_2, payment_date: @invoice.payment_date, payment_method_1: @invoice.payment_method_1, payment_method_2: @invoice.payment_method_2, purchase_date: @invoice.purchase_date, refund_amount: @invoice.refund_amount, refund_method: @invoice.refund_method, return_date: @invoice.return_date, sale_completed: @invoice.sale_completed, sale_discount: @invoice.sale_discount, sale_discount_reason: @invoice.sale_discount_reason, sale_price: @invoice.sale_price, sales_person_1: @invoice.sales_person_1, sales_person_2: @invoice.sales_person_2, veterinarian_id: @invoice.veterinarian_id } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { canine_id: @invoice.canine_id, commission_percent: @invoice.commission_percent, credit_card_last_4: @invoice.credit_card_last_4, customer_id: @invoice.customer_id, invoice_status: @invoice.invoice_status, paper_deliver_method: @invoice.paper_deliver_method, payment_amount_1: @invoice.payment_amount_1, payment_amount_2: @invoice.payment_amount_2, payment_date: @invoice.payment_date, payment_method_1: @invoice.payment_method_1, payment_method_2: @invoice.payment_method_2, purchase_date: @invoice.purchase_date, refund_amount: @invoice.refund_amount, refund_method: @invoice.refund_method, return_date: @invoice.return_date, sale_completed: @invoice.sale_completed, sale_discount: @invoice.sale_discount, sale_discount_reason: @invoice.sale_discount_reason, sale_price: @invoice.sale_price, sales_person_1: @invoice.sales_person_1, sales_person_2: @invoice.sales_person_2, veterinarian_id: @invoice.veterinarian_id } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
