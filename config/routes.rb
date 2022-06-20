Rails.application.routes.draw do
  devise_for :users

  root to: "events#index"

  resources :events do
    # Вложенный ресурс комментов
    resources :comments, only: [:create, :destroy]

    # вложенный ресурс подписок
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: %i[create destroy]

    post :show, on: :member
  end
  resources :users, only: [:show, :edit, :update]
end
