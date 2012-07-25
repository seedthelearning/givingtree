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
    let(:existing_user) { Fabricate(:user) }
    let(:new_user) { Fabricate.build(:user) }

    before(:each) do
      visit root_path
    end

    it "should be prompted to sign in when creating a seed" do
      submit_seed_form
      page.should have_field 'sign_in_user_email'
      page.should have_field 'sign_in_user_password'
      page.should have_field 'sign_in_user_password_confirmation'
    end

    it "should be prompted to sign up when creating a seed" do
      submit_seed_form
      page.should have_field 'sign_up_user_email'
      page.should have_field 'sign_up_user_password'
      page.should have_field 'sign_up_user_password_confirmation'
    end

    it "should be prompted for their payment information after signing in" do
      submit_seed_form
      submit_sign_in_form_as(existing_user)
      page.should have_field 'credit_card_number'
    end

    it "should be prompted for their payment information after signing up" do
      submit_seed_form
      submit_sign_up_form_as(new_user)
      page.should have_field 'credit_card_number'
    end
  end
end
