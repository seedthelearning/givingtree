SeedTheLearning::Application.routes.draw do
  devise_for :users

  root :to => 'welcome#index'

  match '/create_seed_from_session' => 'seeds#create_from_session', :as => :create_seed_from_session
  match '/payment_information' => 'users#update_stripe_token', :as => :update_user_stripe_token

  resources :seeds

  namespace :api do
    resource :tree
  end
end
