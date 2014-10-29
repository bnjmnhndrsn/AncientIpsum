AncientAliensApp::Application.routes.draw do
  resources :quotes, only: [:index, :show]
  root 'static_pages#random'
  match '/random', to: 'static_pages#random', via: 'get'
  match '/search', to: 'static_pages#search', via: 'get'
  match '/results', to: 'static_pages#results', via: 'get'
end
