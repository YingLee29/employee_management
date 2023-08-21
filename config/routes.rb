Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :members
  resources :projects do
    collection do
      get :list_members
    end
  end
end
