class ParticipantsController < ApplicationController
  include Support::Scooper

  def show
    if current_user
      response = create_participant(current_user.id, params[:id])
      if response[:status] == 201
        render :json => SCOOP_CLIENT.get_tree(params[:id])
      else
      render :text => "sad times fails"
      end
    else
      # sign up or login
    end
  end
end
