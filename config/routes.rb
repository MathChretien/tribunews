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
<<<<<<< HEAD
<<<<<<< HEAD
  devise_for :users, only: [:edit, :show, :update]
=======
  devise_for :users
  resources :users, only: [:edit, :show, :update]
  root to: 'tribes#index'
>>>>>>> 42db8c6a52d5963cfe038b38422bcbda67334a3d
=======


  devise_for :users
  resources :users, only: [:edit, :show, :update]
  root to: 'tribes#index'

>>>>>>> b87ddbef2d4a3a1f2b672b4b26fc7ec2d2fd10c2
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
