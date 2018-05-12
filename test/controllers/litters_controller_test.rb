require 'test_helper'

class LittersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @litter = litters(:one)
  end

  test "should get index" do
    get litters_url
    assert_response :success
  end

  test "should get new" do
    get new_litter_url
    assert_response :success
  end

  test "should create litter" do
    assert_difference('Litter.count') do
      post litters_url, params: { litter: { arrival_date: @litter.arrival_date, available_date: @litter.available_date, birth_date: @litter.birth_date, breed_id: @litter.breed_id, broker_id: @litter.broker_id, dam_id: @litter.dam_id, female_count: @litter.female_count, male_count: @litter.male_count, pedigree_id: @litter.pedigree_id, sire_id: @litter.sire_id } }
    end

    assert_redirected_to litter_url(Litter.last)
  end

  test "should show litter" do
    get litter_url(@litter)
    assert_response :success
  end

  test "should get edit" do
    get edit_litter_url(@litter)
    assert_response :success
  end

  test "should update litter" do
    patch litter_url(@litter), params: { litter: { arrival_date: @litter.arrival_date, available_date: @litter.available_date, birth_date: @litter.birth_date, breed_id: @litter.breed_id, broker_id: @litter.broker_id, dam_id: @litter.dam_id, female_count: @litter.female_count, male_count: @litter.male_count, pedigree_id: @litter.pedigree_id, sire_id: @litter.sire_id } }
    assert_redirected_to litter_url(@litter)
  end

  test "should destroy litter" do
    assert_difference('Litter.count', -1) do
      delete litter_url(@litter)
    end

    assert_redirected_to litters_url
  end
end
