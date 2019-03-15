Rails.application.routes.draw do
  root to: 'tribes#index'

  get 'pages/index'
  get 'pages/show'
  get 'pages/edit'
  get 'pages/update'
  get 'newspapers/index'
  get 'newspapers/show'

  resources :boxes
  resources :tribes
  resources :pictures
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :users, only: [:edit, :show, :update]
  root to: 'tribes#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
