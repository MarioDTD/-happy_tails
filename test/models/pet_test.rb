require "test_helper"

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "name should be present" do
    pet = Pet.new
    assert_not pet.save, "Saved the pet without a name"
  end

  test "animal should be present" do
    pet = Pet.new
    assert_not pet.save, "Saved the pet without an animal"
  end

  test "breed should be present" do
    pet = Pet.new
    assert_not pet.save, "Saved the pet without a breed"
  end

  test "fee should be present" do
    pet = Pet.new
    assert_not pet.save, "Saved the pet without a fee"
  end

  test "photos should be present" do
    pet = Pet.new
    assert_not pet.save, "Saved the pet without photos"
  end
end
