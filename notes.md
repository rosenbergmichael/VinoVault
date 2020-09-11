VinoVault



  -Able to switch users by just changing user id in url, how do I prevent that?  







MANY to MANY

-user.reviewd_wines to see wines that user has reviewed (Add My Reviewed Wines tab ?)

-wine can have many categories, category has many wines


-wine.users to see who's reviewed it  ?





l







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

  -name (type(red, white, etc.), grape, region, etc.)

