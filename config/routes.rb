Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :purchase_records, only: [:index]
  end
end
