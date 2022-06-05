Rails.application.routes.draw do
  resources :users
  # корень сайта
  root to: "events#index"

  resources :events
  resources :users, only: [:show, :edit, :update]

end
