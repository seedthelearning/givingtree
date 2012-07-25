class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    if session[:seed_amount_dollars]
      create_seed_from_session_path
    elsif session[:seed_id]
      create_participant_from_session_path
    elsif current_user.links.count > 0
      user_path(current_user)
    else
      super
    end
  end
end
