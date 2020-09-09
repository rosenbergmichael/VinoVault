class ReviewsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index
    if params[:wine_id] && @wine = Wine.find_by_id(params[:wine_id])
      @reviews = @wine.reviews
    else 
      @error = "That wine doesn't exist" if params[:wine_id]
      @reviews = Review.all
    end 
  end

  def new
    @review = Review.new 
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to reviews_path
    else 
      render :new
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :notes, :wine_id)
  end


end
