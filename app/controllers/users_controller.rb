class UsersController < ApplicationController
  include Support::Scooper
  include Support::Planter

  def show
    @user = User.find(params[:id])
    @links = @user.links
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    plant_seed(session[:seed_amount_dollars])
  end
end
