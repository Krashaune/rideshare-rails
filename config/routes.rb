Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trips#index'

  resources :trips

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :drivers

end
