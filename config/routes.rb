Rails.application.routes.draw do

  root "landing#index"

  resources :landing, only: :index

  devise_for :users

  resources :kits

  resources :kits do
    resources :posts
    get 'tags/:tag', to: 'kits#show', as: :tag
  end

end
