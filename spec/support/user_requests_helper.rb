def submit_sign_in_form_as(user)
  fill_in 'sign_in_user_email', with: user.email
  fill_in 'sign_in_user_password', with: user.password
  click_button 'Sign in'
end

def submit_sign_up_form_as(user)
  fill_in 'sign_up_user_email', with: user.email
  fill_in 'sign_up_user_password', with: user.password
  fill_in 'sign_up_user_password_confirmation', with: user.password
  click_button 'Sign up'
end

def submit_seed_form
  fill_in 'seed_amount_dollars', with: rand(100)
  click_button 'submit'
end
