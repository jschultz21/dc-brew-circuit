Rails.application.routes.draw do
  resources :favorite_beers, only: [:index, :create, :destroy]
  resources :added_breweries, only: [:index, :create, :destroy]


  devise_for :users, controllers: { registrations: "registrations" }
  get 'users/new' # NHO: is this route necessary?
  resources :breweries do
    resources :beers do
      resources :reviews
    end
  end

  root 'home#index'

end
