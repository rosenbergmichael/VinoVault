class WinesController < ApplicationController

  before_action :redirect_if_not_logged_in

  def new
    @wine = Wine.new
  end

end
