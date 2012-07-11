SeedTheLearning::Application.routes.draw do
  root :to => 'welcome#index'

  namespace :api do
    resource :tree
  end
end
