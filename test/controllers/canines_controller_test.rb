require 'test_helper'

class CaninesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canine = canines(:one)
  end

  test "should get index" do
    get canines_url
    assert_response :success
  end

  test "should get new" do
    get new_canine_url
    assert_response :success
  end

  test "should create canine" do
    assert_difference('Canine.count') do
      post canines_url, params: { canine: { arrival_weight: @canine.arrival_weight, available_date: @canine.available_date, color: @canine.color, cost: @canine.cost, cost: @canine.cost, fault_description: @canine.fault_description, fault_discount: @canine.fault_discount, fault_discount: @canine.fault_discount, gender: @canine.gender, last_sold_date: @canine.last_sold_date, litter_id: @canine.litter_id, micro_chip_number: @canine.micro_chip_number, on_hold: @canine.on_hold, on_hold_reason: @canine.on_hold_reason, price: @canine.price, price: @canine.price, registration_company_id: @canine.registration_company_id, sale_price: @canine.sale_price, sale_price: @canine.sale_price, sale_status_id: @canine.sale_status_id, sale_weight: @canine.sale_weight, weight_category_id: @canine.weight_category_id } }
    end

    assert_redirected_to canine_url(Canine.last)
  end

  test "should show canine" do
    get canine_url(@canine)
    assert_response :success
  end

  test "should get edit" do
    get edit_canine_url(@canine)
    assert_response :success
  end

  test "should update canine" do
    patch canine_url(@canine), params: { canine: { arrival_weight: @canine.arrival_weight, available_date: @canine.available_date, color: @canine.color, cost: @canine.cost, cost: @canine.cost, fault_description: @canine.fault_description, fault_discount: @canine.fault_discount, fault_discount: @canine.fault_discount, gender: @canine.gender, last_sold_date: @canine.last_sold_date, litter_id: @canine.litter_id, micro_chip_number: @canine.micro_chip_number, on_hold: @canine.on_hold, on_hold_reason: @canine.on_hold_reason, price: @canine.price, price: @canine.price, registration_company_id: @canine.registration_company_id, sale_price: @canine.sale_price, sale_price: @canine.sale_price, sale_status_id: @canine.sale_status_id, sale_weight: @canine.sale_weight, weight_category_id: @canine.weight_category_id } }
    assert_redirected_to canine_url(@canine)
  end

  test "should destroy canine" do
    assert_difference('Canine.count', -1) do
      delete canine_url(@canine)
    end

    assert_redirected_to canines_url
  end
end
