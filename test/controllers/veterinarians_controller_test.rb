require 'test_helper'

class VeterinariansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veterinarian = veterinarians(:one)
  end

  test "should get index" do
    get veterinarians_url
    assert_response :success
  end

  test "should get new" do
    get new_veterinarian_url
    assert_response :success
  end

  test "should create veterinarian" do
    assert_difference('Veterinarian.count') do
      post veterinarians_url, params: { veterinarian: { address1: @veterinarian.address1, address2: @veterinarian.address2, business_hours: @veterinarian.business_hours, city: @veterinarian.city, company_name: @veterinarian.company_name, fax: @veterinarian.fax, first_name: @veterinarian.first_name, home_phone: @veterinarian.home_phone, last_name: @veterinarian.last_name, mobile_phone: @veterinarian.mobile_phone, state: @veterinarian.state, zip: @veterinarian.zip } }
    end

    assert_redirected_to veterinarian_url(Veterinarian.last)
  end

  test "should show veterinarian" do
    get veterinarian_url(@veterinarian)
    assert_response :success
  end

  test "should get edit" do
    get edit_veterinarian_url(@veterinarian)
    assert_response :success
  end

  test "should update veterinarian" do
    patch veterinarian_url(@veterinarian), params: { veterinarian: { address1: @veterinarian.address1, address2: @veterinarian.address2, business_hours: @veterinarian.business_hours, city: @veterinarian.city, company_name: @veterinarian.company_name, fax: @veterinarian.fax, first_name: @veterinarian.first_name, home_phone: @veterinarian.home_phone, last_name: @veterinarian.last_name, mobile_phone: @veterinarian.mobile_phone, state: @veterinarian.state, zip: @veterinarian.zip } }
    assert_redirected_to veterinarian_url(@veterinarian)
  end

  test "should destroy veterinarian" do
    assert_difference('Veterinarian.count', -1) do
      delete veterinarian_url(@veterinarian)
    end

    assert_redirected_to veterinarians_url
  end
end
