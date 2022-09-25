Rails.application.routes.draw do
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  devise_for :users
  resources :users
  resources :articles



  root "articles#index"
end
