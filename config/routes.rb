Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reviews, only: [:new, :create, :index, :show, :edit, :update]
  resources :user_bottles, only: [:index, :create, :new]
  resources :wishes, only: [:index, :create, :new, :destroy]
  resources :bottles, only: [:index, :show, :new, :create]
  resources :recommendations, only: [:index]
  get 'recommendations/search', to: "recommendations#search", as: :search
end
