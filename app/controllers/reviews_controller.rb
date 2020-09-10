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
    if params[:wine_id] && @wine = Wine.find_by_id(params[:wine_id])
      @review = @wine.reviews.build
    else
      @error = "That wine doesn't exist" if params[:wine_id]
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to wine_path(@review.wine)
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

  def update
    @review = Review.find_by(id: params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else 
      render :edit 
    end
  end

 
  private

  def review_params
    params.require(:review).permit(:rating, :notes, :wine_id)
  end


end
