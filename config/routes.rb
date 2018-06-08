Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles, only: [:index, :show] do
    resources :comments
  end


#routes for admin
  namespace :admin do
    resources :articles
  end

  root 'welcome#index'
end
