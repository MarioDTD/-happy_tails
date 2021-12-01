class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :animal, presence: true
  validates :breed, presence: true
  validates :fee, presence: true
  validates :image_url, presence: true

  def liked?(user)
    likes.find { |like| like.user_id == user.id }
  end
end
