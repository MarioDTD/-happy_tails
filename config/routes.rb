Rails.application.routes.draw do
  devise_for :users

  root to: "pets#index"
  resources :pets, except: [:new, :create] do
    collection do
      get :dogs
      get :cats
    end
  end
  resources :shelters, only: [:show, :new, :create] do
    resources :pets, only: [:new, :create]
  end

  # resources :likes do
  #   resources :pets, only: [:show]
  #   put :update, on: :member

  resources :pets do
    resources :like, only: [:create, :destroy, :index]
  end
end
