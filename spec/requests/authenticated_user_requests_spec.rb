require 'spec_helper'

describe "Authenticated User" do
  let(:user) { Fabricate.build(:user) }

  before(:each) do
    visit new_user_registration_path
    submit_sign_up_form_as(user)
    visit root_path
  end

  context "viewing the welcome page" do
    it "should see their email address" do
      page.should have_link user.email
    end

    it "should see a sign out link" do
      page.should have_link 'sign_out'
    end

    it "should not see a sign up link" do
      page.should_not have_link 'sign_up'
    end

    it "should not see a sign in link" do
      page.should_not have_link 'sign_in'
    end
  end
end
