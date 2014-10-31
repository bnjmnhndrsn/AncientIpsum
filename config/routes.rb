AncientAliensApp::Application.routes.draw do
  resources :quotes, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]
  root 'static_pages#random'
  match '/login', to: 'sessions#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signin', to: 'sessions#create', via: 'post'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/random', to: 'static_pages#random', via: 'get'
  match '/search', to: 'static_pages#search', via: 'get'
end
