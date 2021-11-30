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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
