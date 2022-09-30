Rails.application.routes.draw do
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  

  devise_for :users
  resources :users


  resources :articles do
    resources :comments
  end


  put '/article/:id/like', to: 'article#like', as: 'like'

  root "articles#index"
end
