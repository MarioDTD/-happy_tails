require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get pets_path
    assert_response :success
  end

  test "should get all dogs" do
    get dogs_pets_path
    assert_response :success
  end

  test "should get all cats" do
    get cats_pets_path
    assert_response :success
  end

end
