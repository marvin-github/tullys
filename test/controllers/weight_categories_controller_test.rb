require 'test_helper'

class WeightCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weight_category = weight_categories(:one)
  end

  test "should get index" do
    get weight_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_weight_category_url
    assert_response :success
  end

  test "should create weight_category" do
    assert_difference('WeightCategory.count') do
      post weight_categories_url, params: { weight_category: { description: @weight_category.description, name: @weight_category.name, require_sale_weight: @weight_category.require_sale_weight } }
    end

    assert_redirected_to weight_category_url(WeightCategory.last)
  end

  test "should show weight_category" do
    get weight_category_url(@weight_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_weight_category_url(@weight_category)
    assert_response :success
  end

  test "should update weight_category" do
    patch weight_category_url(@weight_category), params: { weight_category: { description: @weight_category.description, name: @weight_category.name, require_sale_weight: @weight_category.require_sale_weight } }
    assert_redirected_to weight_category_url(@weight_category)
  end

  test "should destroy weight_category" do
    assert_difference('WeightCategory.count', -1) do
      delete weight_category_url(@weight_category)
    end

    assert_redirected_to weight_categories_url
  end
end
