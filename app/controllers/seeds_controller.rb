class SeedsController < ApplicationController
  include Support::Scooper
  include Support::Planter

  def create
    if current_user
      if current_user.stripe_token
        plant_seed(params[:seed][:amount_dollars])
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
      plant_seed(amount)
    else
      redirect_to new_stripe_token_path,
        alert: "Almost there! Enter your credit card information to create your seed."
    end
  end
end
