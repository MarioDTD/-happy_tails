class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :animal, presence: true
  validates :breed, presence: true
  validates :fee, presence: true
  validates :image_url, presence: true

  scope :animal, -> (animal) do
    sql_query = " \
      pets.animal ILIKE ? \
    "
    where(sql_query, "%#{animal}%")
  end

  scope :breed, -> (breed) do
    sql_query = " \
      pets.breed ILIKE ? \
    "
    where(sql_query, "%#{breed}%")
  end

  scope :gender, -> (gender) do
    sql_query = " |
      pets.gender ILIKE ? \
    "
  end
end
