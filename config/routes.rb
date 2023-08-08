# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#index"
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations',
              }
  resources :members, except: [:show]
  resources :projects do
    collection do
      get :list_members
    end
  end
end
