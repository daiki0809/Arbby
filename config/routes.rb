Rails.application.routes.draw do
  
  get 'users/show'
  root :to => 'homes#top'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'homes/about'
  get 'homes/check'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :hobbies, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
        resource :challenges, only: [:create, :destroy]
  end

  resources :levels, only: [:update]
end
