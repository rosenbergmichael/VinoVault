class User < ApplicationRecord
  has_many :wines
  has_many :reviews
  has_many :reviewed_wines, through: :reviews, source: :wine 
  has_many :categories, through: :wines 

  has_secure_password
 
  validates :username, :email, presence: true 
  validates_uniqueness_of :username
  validates :age, numericality: { greater_than_or_equal_to: 21 }, allow_blank: true 

  def self.most_wines 
    User.left_joins(:wines).group(:id).order('COUNT(wines.id) DESC').limit(1)
  end 


end

