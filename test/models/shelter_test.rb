require "test_helper"

class ShelterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @shelter = Shelter.new(name: "Shelter 1", address: "123 Main St",
      contact: "555-555-5555", email: "shelter@example.com")
    @user = User.create!(email: 'john@gmail.com', password: '123123')
  end

  test "name should be present" do
    shelter = Shelter.new
    assert_not shelter.save, "Saved the shelter without a name"
  end

  test "address should be present" do
    shelter = Shelter.new
    assert_not shelter.save, "Saved the shelter without an address"
  end

  test "contact should be present" do
    shelter = Shelter.new
    assert_not shelter.save, "Saved the shelter without a contact"
  end

  test "email should be present" do
    shelter = Shelter.new
    assert_not shelter.save, "Saved the shelter without an email"
  end

  test "user_id should be unique" do
    shelter_one = @shelter
    shelter_two = Shelter.new(name: "Shelter 1", address: "123 Main St",
                           contact: "555-555-5555", email: "shelter@example.com")
    shelter_one.user_id = shelter_two.user_id
    assert_not shelter_one.valid?
  end

end
