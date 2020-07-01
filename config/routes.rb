Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :product do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:new, :show] do
    resources :payments, only: [:new]
    collection do
      get :confirmation
      get :intervention_schedueles
    end
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
