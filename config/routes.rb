Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bookings, only: [:create,:new,:show] do 
    collection do 
      get :confirmation 
      get :intervention_schedueles
     
    end
  end
 
end
