require 'test_helper'

class RegistrationCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration_company = registration_companies(:one)
  end

  test "should get index" do
    get registration_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_company_url
    assert_response :success
  end

  test "should create registration_company" do
    assert_difference('RegistrationCompany.count') do
      post registration_companies_url, params: { registration_company: { address1: @registration_company.address1, address2: @registration_company.address2, city: @registration_company.city, company_name: @registration_company.company_name, fax: @registration_company.fax, first_name: @registration_company.first_name, home_phone: @registration_company.home_phone, last_name: @registration_company.last_name, mobile_phone: @registration_company.mobile_phone, state: @registration_company.state, zip: @registration_company.zip } }
    end

    assert_redirected_to registration_company_url(RegistrationCompany.last)
  end

  test "should show registration_company" do
    get registration_company_url(@registration_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_company_url(@registration_company)
    assert_response :success
  end

  test "should update registration_company" do
    patch registration_company_url(@registration_company), params: { registration_company: { address1: @registration_company.address1, address2: @registration_company.address2, city: @registration_company.city, company_name: @registration_company.company_name, fax: @registration_company.fax, first_name: @registration_company.first_name, home_phone: @registration_company.home_phone, last_name: @registration_company.last_name, mobile_phone: @registration_company.mobile_phone, state: @registration_company.state, zip: @registration_company.zip } }
    assert_redirected_to registration_company_url(@registration_company)
  end

  test "should destroy registration_company" do
    assert_difference('RegistrationCompany.count', -1) do
      delete registration_company_url(@registration_company)
    end

    assert_redirected_to registration_companies_url
  end
end
