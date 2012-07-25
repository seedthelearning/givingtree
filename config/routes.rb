SeedTheLearning::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }

  root :to => 'welcome#index'

  match '/create_seed_from_session' => 'seeds#create_from_session', :as => :create_seed_from_session
  match '/create_participant_from_session' => 'participants#create_from_session', :as => :create_participant_from_session

  resources :seeds, :stripe_tokens, :users, :participants

  namespace :api do
    match '/tree/values' => 'trees#values', :as => :tree_values
    resources :trees, only: [ :show ]
  end
end
