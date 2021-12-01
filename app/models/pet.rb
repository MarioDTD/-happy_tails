class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :likes
  validates :name, presence: true
  validates :animal, presence: true
  validates :breed, presence: true
  validates :fee, presence: true
  validates :image_url, presence: true

  scope :by_breed, -> (pet_breed) do
    where("breed = ?", "#{pet_breed}")
  end
end
