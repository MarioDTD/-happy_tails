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

end
