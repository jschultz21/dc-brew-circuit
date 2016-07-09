Rails.application.routes.draw do
  resources :favorite_beers, only: [:index, :create, :destroy]
  resources :saved_breweries, only: [:index, :create, :destroy]


  devise_for :users, controllers: { registrations: "registrations" }
  get 'users/new'
  resources :breweries do
    resources :beers do
      resources :reviews
    end
  end

  root 'home#index'

end
