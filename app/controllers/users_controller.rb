class UsersController < ApplicationController
  include Support::Scooper
  include Support::Planter

  def show
    if current_user
      @links = current_user.links
    else
      authenticate_user!
    end
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    plant_seed(session[:seed_amount_dollars])
  end
end
