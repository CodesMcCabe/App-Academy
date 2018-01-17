Rails.application.routes.draw do

  resources :users
  resource :session
  resources :subs do
    resources :posts, only: [:create, :new]
  end
  resources :posts, except: [:create, :new, :index] do
    resources :comments, only: [:new]
  end
  
  resources :comments, only: [:create, :show]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
