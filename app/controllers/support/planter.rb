module Support::Planter
  def plant_seed(amount_dollars)
    if session[:seed_id]
      response = create_reseed(current_user.id, session[:seed_id], amount_dollars)
    else
      response = create_seed(current_user.id, amount_dollars)
    end

    if response[:status] == 201
      session.delete(:seed_id)
      current_user.create_link(response[:link], response[:id])
      redirect_to user_path(current_user)
    end
  end
end
