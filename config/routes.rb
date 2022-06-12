Rails.application.routes.draw do
  resources :subscriptions
  devise_for :users

  root to: "events#index"

  resources :events do
    # Вложенный ресурс комментов
    resources :comments, only: [:create, :destroy]

    # вложенный ресурс подписок
    resources :subscriptions, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
