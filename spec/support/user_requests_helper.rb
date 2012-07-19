def sign_up_as(user)
  visit new_user_registration_path
  fill_in 'user_email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password
  click_button 'Sign up'
end

def submit_seed_form
  fill_in 'seed_amount', with: rand(100)
  click_button 'submit'
end
