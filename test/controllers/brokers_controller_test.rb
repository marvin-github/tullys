require 'test_helper'

class BrokersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broker = brokers(:one)
  end

  test "should get index" do
    get brokers_url
    assert_response :success
  end

  test "should get new" do
    get new_broker_url
    assert_response :success
  end

  test "should create broker" do
    assert_difference('Broker.count') do
      post brokers_url, params: { broker: { address1: @broker.address1, address2: @broker.address2, city: @broker.city, company_name: @broker.company_name, fax: @broker.fax, first_name: @broker.first_name, home_phone: @broker.home_phone, last_name: @broker.last_name, mobile_phone: @broker.mobile_phone, state: @broker.state, zip: @broker.zip } }
    end

    assert_redirected_to broker_url(Broker.last)
  end

  test "should show broker" do
    get broker_url(@broker)
    assert_response :success
  end

  test "should get edit" do
    get edit_broker_url(@broker)
    assert_response :success
  end

  test "should update broker" do
    patch broker_url(@broker), params: { broker: { address1: @broker.address1, address2: @broker.address2, city: @broker.city, company_name: @broker.company_name, fax: @broker.fax, first_name: @broker.first_name, home_phone: @broker.home_phone, last_name: @broker.last_name, mobile_phone: @broker.mobile_phone, state: @broker.state, zip: @broker.zip } }
    assert_redirected_to broker_url(@broker)
  end

  test "should destroy broker" do
    assert_difference('Broker.count', -1) do
      delete broker_url(@broker)
    end

    assert_redirected_to brokers_url
  end
end
