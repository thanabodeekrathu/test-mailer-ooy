Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: 'home#index'
  end

  unauthenticated :user do 
    devise_scope :user do
      root to: 'devise/sessions#new' 
    end
  end
  
end
