class ReviewsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index
    @reviews = Review.all
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
    params.require(:review).permit(:rating, :notes)
  end


end
