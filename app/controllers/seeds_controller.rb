class SeedsController < ApplicationController
  include Support::Scooper

  def create
    if current_user
      if current_user.stripe_token
        create_seed_or_enter_payment(params[:seed][:amount_dollars])
        flash[:alert] = "You've pledged $#{params[:seed][:amount_dollars]}. 
            Share the link to build your tree!"
      else
        session[:seed_amount_dollars] = params[:seed][:amount_dollars]
        redirect_to new_stripe_token_path,
          alert: "Almost there! Enter your credit card information to create your seed."
      end
    else
      session[:seed_amount_dollars] = params[:seed][:amount_dollars]
      authenticate_user!
    end
  end

  def create_from_session
    if current_user.stripe_token
      amount = session.delete(:seed_amount_dollars)
      flash[:alert] = "You've pledged $#{amount} to seed learning.
          Share the link and build your tree!"
      create_seed_or_enter_payment(amount)
    else
      redirect_to new_stripe_token_path,
        alert: "Almost there! Enter your credit card information to create your seed."
    end
  end

  private

  def create_seed_or_enter_payment(amount_dollars)
    response = create_seed(current_user.id, amount_dollars)
    if response[:status] == 201
      current_user.create_link(response[:link])
      redirect_to user_path(current_user)
    end
  end
end
