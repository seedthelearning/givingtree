require 'spec_helper'

describe "Unauthenticated User" do
  context "viewing the welcome page" do
    before(:each) do
      visit root_path
    end

    it "should see a sign up link" do
      page.should have_link 'sign_up'
    end

    it "should see a sign in link" do
      page.should have_link 'sign in'
    end

    it "should not see a sign out link" do
      page.should_not have_link 'sign out'
    end
  end

  context "creating a seed" do
    before(:each) do
      visit root_path
    end

    it "should be prompted to sign in when creating a seed" do
      submit_seed_form
      page.should have_field 'user_email'
      page.should have_field 'user_password'
    end

    xit "should be prompted to sign up when creating a seed" do
    end
  end
end
