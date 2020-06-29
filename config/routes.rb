Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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

end
