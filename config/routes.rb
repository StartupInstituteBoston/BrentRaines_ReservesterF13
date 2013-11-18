Reservester::Application.routes.draw do
  devise_for :users
  resources :restaurants do
    resources :reservations, only: [:create, :destroy]
  end
 
  root 'restaurants#index'

end
