class WelcomeController < ApplicationController
  def index
    @seed = Seed.new
  end
end
