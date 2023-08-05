# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#index"
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations',
              }
  resources :members, only: [:index, :create, :new]
  resources :projects, only: [:index, :create, :new]
end
