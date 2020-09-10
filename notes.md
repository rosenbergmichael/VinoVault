VinoVault

-Google oauth seems off, when I click my sign in with google link it keeps automatically signing me in with the original google email I chose, not giving me list of google email options

-Able to switch users by just changing user id in url, how do I prevent that?

-Trying to figure out how to allow user to delete the reviews they've wrote

    -can I add this feature to the Wine show view, or does it have to be a Review view since the action is in the 
    Reviews controller?

    -Do I need to add a route in config/routes.rb: 
      delete '/destroy' => 'reviews#destroy'

    -Action for ReviewsController?
      def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to reviews_path
      end

    























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

