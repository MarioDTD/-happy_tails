Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    collection do
      get :dogs
      get :cats
    end
  end
    resources :pets do
      resources :likes do
    end
  end
end
