SeedTheLearning::Application.routes.draw do
  root :to => 'welcome#index'

  resources :seeds

  namespace :api do
    resource :tree
  end
end
