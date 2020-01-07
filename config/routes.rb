Rails.application.routes.draw do
  root "todos#index"
  devise_for :users

    resources :todos, except: [:show]do
      collection do
        get :deadline
        get :done_index
      end
      member do
        get :search
        post :done
        post :done_back
      end
    end
    
  resources :users, only: [:edit, :update] 
end
