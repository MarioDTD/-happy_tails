class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :animal, presence: true
  validates :breed, presence: true
  validates :fee, presence: true
  validates :image_url, presence: true

  scope :pet_breed, -> (given_keyword) do
    sql_query = " \
      pets.breed ILIKE ? \
    "

    where(sql_query, "%#{given_keyword}%")
  end
end
