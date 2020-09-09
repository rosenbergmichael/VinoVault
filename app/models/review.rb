class Review < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  validates :notes, presence: true 
  validates :rating, numericality: true
end
