AncientAliensApp::Application.routes.draw do
  resources :quotes, only: [:index, :show]
  root 'static_pages#random'
  match '/random', to: 'static_pages#random', via: 'get'
end
