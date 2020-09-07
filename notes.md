VinoVault

User
  has_many :wines
  has_many :reviews
  has_many :wine_reviews, through: :reviews
  (has_many :catgories, through: :wines)

  -username
  -email
  -password_digest


Wine *join table joining categories and users
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :category

  -name
  -img
  -content

Review *join table joining users and wines
  belongs_to :user
  belongs_to :wine

  -rating
  -notes

Categories
  has_many :wines
  has_many :users, through: :wines


  -type (red, white, rose, sparkling, dessert)
  -grape_variety
  -region