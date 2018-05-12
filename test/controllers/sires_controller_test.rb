require 'test_helper'

class SiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sire = sires(:one)
  end

  test "should get index" do
    get sires_url
    assert_response :success
  end

  test "should get new" do
    get new_sire_url
    assert_response :success
  end

  test "should create sire" do
    assert_difference('Sire.count') do
      post sires_url, params: { sire: { breed_id: @sire.breed_id, breeder_id: @sire.breeder_id, name: @sire.name, picture_id: @sire.picture_id, registration_number: @sire.registration_number } }
    end

    assert_redirected_to sire_url(Sire.last)
  end

  test "should show sire" do
    get sire_url(@sire)
    assert_response :success
  end

  test "should get edit" do
    get edit_sire_url(@sire)
    assert_response :success
  end

  test "should update sire" do
    patch sire_url(@sire), params: { sire: { breed_id: @sire.breed_id, breeder_id: @sire.breeder_id, name: @sire.name, picture_id: @sire.picture_id, registration_number: @sire.registration_number } }
    assert_redirected_to sire_url(@sire)
  end

  test "should destroy sire" do
    assert_difference('Sire.count', -1) do
      delete sire_url(@sire)
    end

    assert_redirected_to sires_url
  end
end
