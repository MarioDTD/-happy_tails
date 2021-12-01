class Like < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :user_id, uniqueness: { scope: :pet_id }
end
