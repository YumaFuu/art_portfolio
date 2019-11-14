Rails.application.routes.draw do
  root to: 'home#show'
  resource :home, only: :show

  namespace :images do
    resources :pictures, only: [:index]
    resources :embroideries, only: [:index]
    resources :illustrations, only: [:index]
  end

  resource :myself, only: :show

  namespace :admin do
    root to: 'sessions#new'
    get 'login',to: 'sessions#new'
    post 'login',to: 'sessions#create'
    delete 'logout',to: 'sessions#destroy'

    get 'singup',to: 'admins#new'
    post 'singup',to: 'admins#create'

    resources :images
    resources :myself, only: :show
  end
end
