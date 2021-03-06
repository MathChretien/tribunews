Rails.application.routes.draw do

  get 'pages/index'
  get 'pages/show'
  get 'pages/edit'
  get 'pages/update'
  get 'newspapers/index'
  get 'newspapers/show'
  get 'newspapers/pdf'
  post 'box_photo', to: "newspapers#box_photo"
  post 'change_layout', to: "pages#change_layout"
  delete 'newspapers/:id', to: 'newspapers#destroy'
  post 'back_library', to: "newspapers#back_library"
  resources :messages

  resources :boxes
  resources :tribes
  resources :pictures
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :users, only: [:edit, :show, :update]

  authenticated :user do
    root 'tribes#show'
  end

  root to: 'tribes#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
