class ParticipantsController < ApplicationController
  include Support::Scooper

  def show
    seed_id = params[:id]
    session[:seed_id] = seed_id

    if current_user
      create_participant_and_render(seed_id)
    else
      flash[:alert] = "Almost there! Log in to unlock $1 and help seed the learning."
      authenticate_user!
    end
  end

  def create_from_session  
    create_participant_and_render(session[:seed_id])
  end

private
  
  def create_participant_and_render(seed_id)
    response = create_participant(current_user.id, seed_id)
    if response[:status] == 201
      flash[:alert] = "You've unlocked $1. Why not plant your own seed?"
    else
      flash[:alert] = "Sorry you've already unlocked a donation from this seed. 
                       Why not plant your own seed?"
    end
    redirect_to root_path
  end
end
