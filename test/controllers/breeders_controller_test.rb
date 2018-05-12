require 'test_helper'

class BreedersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @breeder = breeders(:one)
  end

  test "should get index" do
    get breeders_url
    assert_response :success
  end

  test "should get new" do
    get new_breeder_url
    assert_response :success
  end

  test "should create breeder" do
    assert_difference('Breeder.count') do
      post breeders_url, params: { breeder: { address1: @breeder.address1, address2: @breeder.address2, city: @breeder.city, company_name: @breeder.company_name, fax: @breeder.fax, first_name: @breeder.first_name, home_phone: @breeder.home_phone, last_name: @breeder.last_name, mobile_phone: @breeder.mobile_phone, state: @breeder.state, usda_number: @breeder.usda_number, zip: @breeder.zip } }
    end

    assert_redirected_to breeder_url(Breeder.last)
  end

  test "should show breeder" do
    get breeder_url(@breeder)
    assert_response :success
  end

  test "should get edit" do
    get edit_breeder_url(@breeder)
    assert_response :success
  end

  test "should update breeder" do
    patch breeder_url(@breeder), params: { breeder: { address1: @breeder.address1, address2: @breeder.address2, city: @breeder.city, company_name: @breeder.company_name, fax: @breeder.fax, first_name: @breeder.first_name, home_phone: @breeder.home_phone, last_name: @breeder.last_name, mobile_phone: @breeder.mobile_phone, state: @breeder.state, usda_number: @breeder.usda_number, zip: @breeder.zip } }
    assert_redirected_to breeder_url(@breeder)
  end

  test "should destroy breeder" do
    assert_difference('Breeder.count', -1) do
      delete breeder_url(@breeder)
    end

    assert_redirected_to breeders_url
  end
end
