Reservester::Application.routes.draw do

  devise_for :users
  resources :restaurants do
    resources :reservations, only: [:create, :destroy]
  end
  
  unauthenticated do
    root 'restaurants#index'
  end
  authenticated :user do
    root 'users#dashboard', as: :authenticated_user
  end

end