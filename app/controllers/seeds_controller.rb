class SeedsController < ApplicationController
  def create
    if current_user
      create_seed(params[:seed][:amount_dollars])
    else
      session[:seed_amount_dollars] = params[:seed][:amount_dollars]
      authenticate_user!
    end
  end

  def create_from_session
    create_seed(session.delete(:seed_amount_dollars))
  end

  private

  def create_seed(dollars)
    if Seed.create(amount_dollars: dollars)
      redirect_to new_stripe_token_path
    else
      render 'welcome#index'
    end
  end
end
