# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'notifications', to: 'notifications#index'
  get 'notifications/:id/link_through',
      to: 'notifications#link_through',
      as: :link_through

  resources :users, only: [:index] do
    post 'add_friend/:id', to: 'users#add_friend', as: :add_friend
    post 'request_friend/:id', to: 'users#request_friend', as: :request_friend
  end

  resources :posts do
    post 'like', to: 'posts#like', as: :like
    resources :comments, only: %i[create destroy]
  end


  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/update', to: 'profiles#update', as: :update_profile
end
