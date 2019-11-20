Rails.application.routes.draw do

  get 'admin_hobbies/index'
  get 'admin_hobbies/show'
  get 'users/show'
  root :to => 'homes#top'

  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  get 'homes/about'
  get 'homes/gacha'

  resources :users, only: [:show, :edit, :update, :destroy]

  post 'hobby_comment/reply/:id', to: 'hobby_comments#reply', as: 'hobby_comments_reply'
  resources :hobbies, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
        resource :challenges, only: [:create, :destroy]
        resource :surprises, only: [:create, :destroy]
        resource :hobby_comments, only: [:create, :destroy, :update]
        collection do
          match 'search' => 'hobbies#search', via: [:get, :post]
        end
  end

  resources :levels, only: [:update]

  resources :admin_users, only: [:index, :show, :destroy]

  resources :admin_hobbies, only: [:index, :show, :destroy] do
    collection do
          match 'search' => 'admin_hobbies#search', via: [:get, :post]
    end
  end

  get 'events/catch'
  delete 'events/delete_all'
  resources :events, only: [:create, :index, :update, :destroy]

end
