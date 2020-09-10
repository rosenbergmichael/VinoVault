class Wine < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews 

  validates :name, :content, presence: true 

  scope :alpha, -> { order(:name) }
  # scope :most_reviews, -> { joins(:reviews).group('wines.id').order('count(wines.id) desc')  }

end
