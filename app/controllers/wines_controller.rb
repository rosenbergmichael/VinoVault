class WinesController < ApplicationController

  before_action :redirect_if_not_logged_in

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @wine = @user.wines.build
    else
      @wine = Wine.new 
    end
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @wines = @user.wines
    else
      @error = "That user doesn't exist" if params[:user_id]
      @wines = Wine.all
    end
  end

  def create
    @wine = current_user.wines.build(wine_params)
    if @wine.save
      redirect_to wines_path 
    else 
      render :new 
    end
  end

  def show
    @wine = Wine.find_by_id(params[:id])
    redirect_to wines_path if !@wine 
  end

  def edit
    @wine = Wine.find_by_id(params[:id])
    redirect_to wines_path if !@wine || @wine.user != current_user
    # @wine.build_category if !@wine.category
  end

  def update
    @wine = Wine.find_by(id: params[:id])
    redirect_to wines_path if !@wine || @wine.user != current_user
   if @wine.update(wine_params)
     redirect_to wine_path(@wine)
   else
     render :edit
   end
 end

 def destroy
  # binding.pry
  @wine = Wine.find(params[:id])
  @wine.destroy
  redirect_to wines_path
end

  private

  def wine_params
    params.require(:wine).permit(:name, :img, :content)
  end

end
