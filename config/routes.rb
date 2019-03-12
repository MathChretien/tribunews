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
  devise_for :users, only: [:edit, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
