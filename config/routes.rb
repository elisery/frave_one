Rails.application.routes.draw do
  # Home/landing page
  get "/", to: 'home#index', as: :home 

  # User Dashboard
  # namespace :user do
  #   resource :dashboard, only: [:show]
  # end
  get "/dashboard" => 'users#show', as: :dashboard

  # API Routes
  # /api
  namespace :api, defaults: { format: :json } do 
    # /api/v1
    namespace :v1 do
      # /api/v1/goals
      resources :goals 
      # /api/v1/transactions
      resources :transactions
      # /api/v1/rewards
      resources :rewards
      # /api/v1/session
      resource :session, only: [:create, :destroy]
      # /api/v1/users/current
      resources :users, only: [] do
        get :current, on: :collection
      end
    end

    match "*unmatched_route", to: "application#not_found", via: :all
  end

  # Users 
  resources :users, only:[:new, :create]

  # Sessions
  resource :session, only:[:new, :create, :destroy]

  # Goals
  resources :goals do 
    # Transactions
    resources :transactions, only:[:new, :create, :destroy]
    # Rewards
    # resources :rewards do 
      # resources :reward_items, only:[:new, :create, :edit, :update]
    # end

    
  end
  # SHOULD REWARDS be nested in goal? NO!!
  resources :rewards do 
    resources :reward_items, only:[:new, :create, :edit, :update]
  end

  match "*path", :to => proc {|env| [200, {
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Allow-Methods' => 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Credentials' => 'true',
    'Access-Control-Request-Method' => '*',
    'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization',
  'Content-Type' => 'text/plain'
  
   }, ["CORS Preflight"]] }, :via => [:options]
end
