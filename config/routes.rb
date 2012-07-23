SeedTheLearning::Application.routes.draw do
  devise_for :users

  root :to => 'welcome#index'

  match '/create_seed_from_session' => 'seeds#create_from_session', :as => :create_seed_from_session

  resources :seeds, :stripe_tokens, :users

  namespace :api do
    resource :tree
  end
end
