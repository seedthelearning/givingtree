class UsersController < ApplicationController
  include Support::Scooper

  def show
    @user = User.find(params[:id])
    @links = @user.links
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    response = create_seed(current_user.id, session[:seed_amount_dollars])
    if response[:status] == 201
      current_user.create_link(response[:link])
      redirect_to user_path(current_user)
    end
  end
end
