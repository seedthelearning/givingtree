require 'spec_helper'

describe Api::TreesController do
  it "should return a tree" do
    id = "abcdef"

    SCOOP_CLIENT.should_receive(:get_tree).with(id)

    get "/api/trees/#{id}"
  end
end
