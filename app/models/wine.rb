class Wine < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews 

  scope :alpha, -> { order(:name ) }

end
