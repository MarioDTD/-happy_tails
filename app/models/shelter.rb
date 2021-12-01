class Shelter < ApplicationRecord
  belongs_to :user
  has_many :pets
  validates :name, presence: true
  validates :address, presence: true
  validates :contact, presence: true
  validates :email, presence: true
  validates :user_id, uniqueness: true
end
