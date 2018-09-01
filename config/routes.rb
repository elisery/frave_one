Rails.application.routes.draw do
  # Home/landing page
  get "/", to: 'home#index', as: :home 

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
    
  end
  resources :rewards do 
    resources :reward_items, only:[:new, :create, :edit, :update]
  end

  # global options responder -> makes sure OPTION request for CORS endpoints work
  match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}

end
