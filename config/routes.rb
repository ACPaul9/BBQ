Rails.application.routes.draw do
  # корень сайта
  root to: "events#index"

  resources :events
end
