Rails.application.routes.draw do
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  

  devise_for :users
  resources :users


  resources :articles do
    put :like

    resources :comments
  end

  # POST /articles/:id/likes
  # put '/article/:id/like', to: 'article#like', as: 'like'

  root "articles#index"
end
