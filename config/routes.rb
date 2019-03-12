Rails.application.routes.draw do
  root to: 'tribes#index'
  get 'boxes/index'
  get 'boxes/show'
  get 'boxes/edit'
  get 'boxes/update'
  get 'pages/index'
  get 'pages/show'
  get 'pages/edit'
  get 'pages/update'
  get 'newspapers/index'
  get 'newspapers/show'

  resources :tribes
  # resources :pictures

  devise_for :users
  resources :users, only: [:edit, :show, :update]
  root to: 'tribes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
