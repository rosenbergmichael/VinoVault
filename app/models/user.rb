class User < ApplicationRecord
  has_many :wines
  has_many :reviews
  has_many :reviewed_wines, through: :reviews, source: :wine 

 # has_many :categories, through: :wines

end
