class ParticipantsController < ApplicationController
  include Support::Scooper

  def show
    seed_id = params[:id]
    if current_user
      create_participant_and_render(seed_id)
    else
      session[:seed_id] = seed_id
      authenticate_user!
    end
  end

  def create_from_session  
    seed_id = session.delete(:seed_id)
    create_participant_and_render(seed_id)
  end

private
  
  def create_participant_and_render(seed_id)
    response = create_participant(current_user.id, seed_id)
    if response[:status] == 201
      render :json => SCOOP_CLIENT.get_tree(seed_id)
    else
      render :text => "sad times fails"
    end
  end
end
