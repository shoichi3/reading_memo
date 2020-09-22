Rails.application.routes.draw do
  resources :illustrations, only: :index
  resources :norms, only: :index
  resources :examples, only: :index
  devise_for :users
  root "users#index"
  resources :users, only: [:show]
  resources :books do
    member do
      get 'search'
    end
  end
  
  resources :books, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :memos do
    member do
      get 'search'
    end
  end
  
  resources :books do
    resources :memos, only: [:new, :create, :show, :edit, :update, :destroy]
  end

end
