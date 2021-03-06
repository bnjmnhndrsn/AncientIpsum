AncientAliensApp::Application.routes.draw do
  resources :quotes, only: [:index, :show, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  root 'static_pages#root'
  match '/login', to: 'sessions#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signin', to: 'sessions#create', via: 'post'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/random', to: 'static_pages#random', via: 'get'
  match '/search', to: 'static_pages#search', via: 'get'
  
  namespace :api, defaults: { format: :json } do
    resources :quotes, only: [:index]
  end
  
end
