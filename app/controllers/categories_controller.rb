class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.includes(:wines)
  end

  def show
     @category = Category.find_by_id(params[:id])
  end

  def new
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to category_path
  end

end
