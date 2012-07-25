class TreesController < ApplicationController
  def show
    id = params[:id]
    tree = SCOOP_CLIENT.get_tree(id)

    respond_to do |format|
      format.json { render json: tree }
    end
  end
end
