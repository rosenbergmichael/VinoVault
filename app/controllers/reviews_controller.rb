class ReviewsController < ApplicationController

  before_action :redirect_if_not_logged_in
  before_action :set_review, only: [:show, :edit, :update]
  before_action :redirect_if_not_review_writer, only: [:edit, :update]
 
  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @reviews = @user.reviews
    end 
  end

  def new
    if params[:wine_id] && @wine = Wine.find_by_id(params[:wine_id])
      @review = @wine.reviews.build
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
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review)
    else 
      render :edit 
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to review_path 
  end
 
  private

  def review_params
    params.require(:review).permit(:rating, :notes, :wine_id)
  end

  def set_review
    @review = Review.find_by(id: params[:id])
    if !@review
      flash[:message] = "Review not found"
      redirect_to reviews_path
    end
  end

  def redirect_if_not_review_writer
    redirect_to reviews_path if @review.user != current_user
  end

end
