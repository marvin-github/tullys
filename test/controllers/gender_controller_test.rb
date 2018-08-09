require 'test_helper'

class GenderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gender_index_url
    assert_response :success
  end

end
