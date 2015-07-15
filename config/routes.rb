Rails.application.routes.draw do

  root 'home#index'

  resources :artists do
    resources :albums, except [:index, :show] do
      resources :songs, except [:index, :show] do
      end
    end
  end

  resources :songs, except [:index, :show]
  resources :albums, except [:index, :show]

