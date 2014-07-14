Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'kits#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :kits

  resources :kits do
    resources :posts
    get 'collection/:collection', to: 'kits#show', as: :collection
  end

end
