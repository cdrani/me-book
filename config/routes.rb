# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:index] do
    post 'add_friend/:id', to: 'users#add_friend', as: :add_friend
    post 'request_friend/:id', to: 'users#request_friend', as: :request_friend
  end

  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: [:create]
  end

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/update', to: 'profiles#update', as: :update_profile
end
