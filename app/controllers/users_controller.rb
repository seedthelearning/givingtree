class UsersController < ApplicationController
  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])

    # save the seed and send them to their user show page (profile)
  end
end
