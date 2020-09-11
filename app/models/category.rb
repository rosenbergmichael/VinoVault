class Category < ApplicationRecord
  has_many :wines

  scope :alpha, -> { order(:name) }

end
