require "test_helper"

class SheltersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get new" do
    get new_shelter_path
    assert_response :success
  end
end
