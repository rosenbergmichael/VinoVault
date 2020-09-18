VinoVault

  -Able to switch users by just changing user id in url, how do I prevent that?  





******* add to Users Show to have both 21+ and google sign in work?

    under redirect_if_not_logged_in :

    #if !current_user.age
            # redirect to user edit route?
        # end

****** removing following code from Reviews Index and New, don't think I need it?

       # else 
    #   @error = "No Reviews" if params[:user_id]
    #   @reviews = Review.all


     # else
    #   @error = "That wine doesn't exist" if params[:wine_id]
    #   @review = Review.new



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




#Homework: scope method for user with most wine
#

# 2 ways- scope, orer and call .first on scope method
#OR
#don't use .sort, set counter outside of method (i = 0) and set variable where you compare x to i; if x >= i, push x into i
#if not leave alone 

# Wine scope method is scope :alpha, -> { order(:name) }
# def self.userwines
#   User.left_joins(:wines).group(:id).order('COUNT(wines.id) DESC').limit(1)
# end 
  # puts @most_wines 
  # @featured_companies = Company.joins(:jobs).group(Job.arel_table[:company_id]).order(Job.arel_table[:company_id].count).limit(10)

  # .left_joins(:wines)
  # .group(:id)
  # .order('COUNT(wines.id) DESC')
  # .limit(1)
# end

# User.left_joins(:jobs).group(:id).order('COUNT(jobs.id) DESC').limit(10)

# Company.joins(:jobs).group("jobs.company_id").order("count(jobs.company_id) desc")


# def self.themost
#   User.limit(1).reverse_order.count(:group => :username, :order => :wines.count)
# end

# scope :mostest, -> { joins(:wine).where(wines: {count: max}) }



#   scope :most_wine, -> { order(:username) }

  # scope :most, -> {where(user: self.wines.maximum(:name))}

  # scope :highest, -> { self.wines.count.order(wines: :DESC).limit(1).first }

  # def self.most_wines 
  #   # i = []
  #   # Book.map {|book| book.cost}.max
  #   User.all.map do |x|
  #     # i = []
  #     y = x.wines.count  
  #     puts y.limit(1).first.username 
  #     # puts x.username 
  #   end
  # end

  # def self.most 
  #   User.all.most_wine.map do |x|
  #     x.wines.count

  #   end

  # end

  # scope :bad_races, -> { joins(:races).where(races: { prizes: 'medals' }) }
  
# scope :most-wine, -> {order(user.wines.count.first)}

# @events.sort {|a,b| b.event_at <=> a.event_at }



