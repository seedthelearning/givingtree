class Api::TreesController < ApplicationController
  include UsersHelper

  def show
    id = params[:id]
    tree = SCOOP_CLIENT.get_tree(id)

    respond_to do |format|
      format.json { render json: tree }
    end
  end

  def values
    id = current_user.links.last.seed_id

    values = {
      clicks: seed_participant_count(id),
      tree: seed_total_raised(id)
    }

    respond_to do |format|
      format.json { render json: values }
    end
  end
end
