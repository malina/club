Orderclub::Application.routes.draw do
  devise_for :people, :controllers => {
    registrations: "person/registrations",
    sessions: "person/sessions",
    passwords: "person/passwords"
  }
  
  resources :caterers do
    resource :gen, only: %w(edit update), controller: 'caterer/gen'
    resource :default_delivery_zone, only: %w(edit update), controller: 'caterer/default_delivery_zone'
    resources :branches, only: %w(index create update destroy), controller: 'caterer/branches'
    resources :delivery_zones, only: %w(index create update destroy), controller: 'caterer/delivery_zones'
  end

  resources :cities, only: %w() do
    resources :caterers, only: %w(index)
    resources :districts, only: %w() do
      resources :caterers, only: %w(index)
    end
  end
  
  match '/edit' => 'caterers#edit', via: [:get, :post]
  match '/show' => 'caterers#show', via: [:get, :post]
  match '/review' => 'caterer_reviews#index', via: [:get, :post]
  match '/view' => 'caterers#view', via: [:get, :post]
  match '/person_profile' => 'person_profile#show', via: [:get, :post]
  match '/orders' => 'person_orders#index', via: [:get, :post]
  match '/recovery' => 'pass#edit', via: [:get, :post]
  root to: 'caterers#index'
end
