class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :likes, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :animal, presence: true
  validates :breed, presence: true
  validates :fee, presence: true

  scope :animal, -> (type) do
    sql_query = " \
      pets.animal ILIKE ? \
    "
    where(sql_query, "%#{type}%")
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
    where(sql_query, "%#{gender}%")
  end

  scope :age, -> (min_age, max_age) do
    where('age >= ? AND age <= ?', min_age.to_i, max_age.to_i)
  end
end
