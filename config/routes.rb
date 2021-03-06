Rails.application.routes.draw do

  root 'home#index'

  post '/search', to: 'search#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :items,  only: [:index, :show, :destroy, :create]
    end
  end
end
