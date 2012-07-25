class SessionsController < Devise::SessionsController
  def create
    seed_id = session[:seed_id]
    super
    session[:seed_id] = seed_id
  end
end
