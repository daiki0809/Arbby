Rails.application.routes.draw do
  
  root :to => 'homes#top'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'homes/about'
  get 'homes/check'

  resources :hobbies, only: [:new, :index, :show, :edit, :create, :update]
end
