class Review < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  validates :rating, numericality: true
  validates :notes, presence: true 
  
end
