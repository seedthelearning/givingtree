class UsersController < ApplicationController
  include Support::Scooper

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    response = create_seed(current_user.id, session[:seed_amount_dollars])
    if response[:status] == 201
      render :text => "YES BOOM FROM USERs"
    end
    # save the seed and send them to their user show page (profile)
  end
end
