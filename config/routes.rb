Rails.application.routes.draw do
  # Home/landing page
  get "/", to: 'home#index', as: :home 

  # User Dashboard
  # namespace :user do
  #   resource :dashboard, only: [:show]
  # end
  get "/dashboard" => 'users#show', as: :dashboard

  # Users 
  resources :users, only:[:new, :create]

  # Sessions
  resource :session, only:[:new, :create, :destroy]

  # Goals
  resources :goals do 
    # Transactions
    resources :transactions, only:[:new, :create, :destroy]
  end
  # SHOULD REWARDS be nested in goal?
  resources :rewards

end
