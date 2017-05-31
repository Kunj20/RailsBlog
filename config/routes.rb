Rails.application.routes.draw do

get "/" => "home#index"

resources :posts do

    resources :comments
    end

resources :users

resources :sessions, :only => [:new, :create, :destroy]

match '/signout', to: 'sessions#destroy', via: [:get, :post]

end
