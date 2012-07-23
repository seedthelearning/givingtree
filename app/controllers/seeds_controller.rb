class SeedsController < ApplicationController
  include Support::Scooper
  
  def create
    if current_user 
      if current_user.stripe_token
        create_seed_or_enter_payment(params[:seed][:amount_dollars])
      else
        session[:seed_amount_dollars] = params[:seed][:amount_dollars]
        redirect_to new_stripe_token_path
      end
    else
      session[:seed_amount_dollars] = params[:seed][:amount_dollars]
      authenticate_user!
    end
  end

  def create_from_session
    if current_user.stripe_token
      create_seed_or_enter_payment(session.delete(:seed_amount_dollars))
    else
      redirect_to new_stripe_token_path
    end
  end

  private

  def create_seed_or_enter_payment(amount_dollars)
    response = create_seed(current_user.id, amount_dollars)
    if response[:status] == 201
      render :text => "YES BOOM"
    end
  end
end
