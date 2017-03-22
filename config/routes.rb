Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users,
             only: :registrations,
             defaults: {
               format: :json
             },
             controllers: {
               registrations: 'users/registrations'
             }

  resources :todos do
    resources :items
  end
end
