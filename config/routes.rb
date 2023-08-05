# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#index"
  devise_for :users
  resources :members, only: [:index, :create, :new]
  resources :projects, only: [:index, :create, :new]
end
