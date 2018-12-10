Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reviews, only: [:index, :show, :edit, :update]
  resources :user_bottles, only: [:index, :create, :new] do
    member do
      patch "/update_quantity", to: "user_bottles#update_quantity"
      # patch "/user_bottles/:id/update_quantity", to: "user_bottles#update_quantity"
    end
  end

  resources :wishes, only: [:index, :destroy]
  resources :bottles, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
    resources :wishes, only: [:new, :create]
  end
  resources :recommendations, only: [:index]
  get 'recommendations/search', to: "recommendations#search", as: :search
  get 'pages/home', to: "pages#home", as: :home
end
