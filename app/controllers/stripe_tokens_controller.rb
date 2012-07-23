class StripeTokensController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
  end
end
