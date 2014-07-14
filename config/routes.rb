Rails.application.routes.draw do

  devise_scope :user do
    get "/", :to => "devise/registrations#new"
  end

  devise_for :users

  resources :kits

  resources :kits do
    resources :posts
    get 'collection/:collection', to: 'kits#show', as: :collection
  end

end
