Rails.application.routes.draw do
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  

  devise_for :users
  resources :users
  get 'users/:id', to: "users#show"

  resources :articles do
    put :like

    resources :comments
  end

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  resources :follows



  # POST /articles/:id/likes
  # put '/article/:id/like', to: 'article#like', as: 'like'

  root "articles#index"
end
