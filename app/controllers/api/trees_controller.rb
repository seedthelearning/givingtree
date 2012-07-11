class Api::TreesController < ApplicationController
  def show
    respond_to do |format|
      format.json
    end
  end
end
