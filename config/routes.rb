Rails.application.routes.draw do
  get 'myselves/show'
  get 'myselves_controller/show'
  root to: 'images#show'
  resource :images, only: [:show, :new, :creae, :edit, :update, :destroy] do
    resources :pictures, only: [:index], module: :images
    resources :embroideries, only: [:index], module: :images
  end

  resource :myself, only: :show
end
