require 'test_helper'

class SalesPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_plan = sales_plans(:one)
  end

  test "should get index" do
    get sales_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_plan_url
    assert_response :success
  end

  test "should create sales_plan" do
    assert_difference('SalesPlan.count') do
      post sales_plans_url, params: { sales_plan: { end_date: @sales_plan.end_date, flat_amount: @sales_plan.flat_amount, flat_amount: @sales_plan.flat_amount, flat_percent: @sales_plan.flat_percent, flat_percent: @sales_plan.flat_percent, max_amount: @sales_plan.max_amount, max_amount: @sales_plan.max_amount, start_date: @sales_plan.start_date, variable_percent: @sales_plan.variable_percent, variable_percent: @sales_plan.variable_percent } }
    end

    assert_redirected_to sales_plan_url(SalesPlan.last)
  end

  test "should show sales_plan" do
    get sales_plan_url(@sales_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_plan_url(@sales_plan)
    assert_response :success
  end

  test "should update sales_plan" do
    patch sales_plan_url(@sales_plan), params: { sales_plan: { end_date: @sales_plan.end_date, flat_amount: @sales_plan.flat_amount, flat_amount: @sales_plan.flat_amount, flat_percent: @sales_plan.flat_percent, flat_percent: @sales_plan.flat_percent, max_amount: @sales_plan.max_amount, max_amount: @sales_plan.max_amount, start_date: @sales_plan.start_date, variable_percent: @sales_plan.variable_percent, variable_percent: @sales_plan.variable_percent } }
    assert_redirected_to sales_plan_url(@sales_plan)
  end

  test "should destroy sales_plan" do
    assert_difference('SalesPlan.count', -1) do
      delete sales_plan_url(@sales_plan)
    end

    assert_redirected_to sales_plans_url
  end
end
