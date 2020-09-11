class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :reviews
  has_many :users, through: :reviews 

  validates :name, :content, presence: true 

  scope :alpha, -> { order(:name) }

  
  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end


end
