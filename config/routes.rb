Rails.application.routes.draw do
  # Home/landing page
  get "/", to: 'home#index', as: :home 

  # Users 
  resources :users, only:[:new, :create]

  # Sessions
  resource :session, only:[:new, :create, :destroy]
end
