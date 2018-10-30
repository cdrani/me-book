# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: [:create]
  end

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  post ':user_name/update', to: 'profiles#update', as: :update_profile
end
