class Pet < ApplicationRecord
  belongs_to :shelter

  validates :name, presence: true
  validates :animal, presence: true
  validates :breed, presence: true
  validates :fee, presence: true
end
