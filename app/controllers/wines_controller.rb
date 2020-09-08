class WinesController < ApplicationController

  before_action :redirect_if_not_logged_in

  def new
    @wine = Wine.new
  end

  def create
    @wine = current_user.wines.build(wine_params)
    if @wine.save
      redirect_to wines_path 
    else 
      render :new 
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :img, :content)
  end

end
