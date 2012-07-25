class ParticipantsController < ApplicationController
  include Support::Scooper

  def show
    seed_id = params[:id]
    session[:seed_id] = seed_id

    if current_user
      create_participant_and_render(seed_id)
    else
      flash[:block] = "Almost there! Sign in and we'll give $1 to DonorsChoose.org."
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
      flash[:block] = "Thank you for valuing education! Keep the tree growing and plant your own seed."
    else
      flash[:block] = "Sorry you've already unlocked a donation from this seed. Why not plant your own seed?"
    end
    redirect_to root_path
  end
end
