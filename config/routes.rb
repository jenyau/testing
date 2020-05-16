Rails.application.routes.draw do
  devise_for :users

  resources :tickets, only: [:show, :create]
  resource :search, only: [:new, :edit, :show]

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :routes
  end

  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

end
