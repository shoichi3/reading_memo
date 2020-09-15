Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:show]
  resources :books, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :books do
    resources :memos, only: [:new, :create, :show, :edit, :update, :destroy]
  end
end
