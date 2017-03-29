Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :line_items
  resources :carts
  root 'home#index'

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'invalid_cart' => 'carts#invalid_cart', as: :invalid_cart
  get 'thank_you' => 'orders#thank_you', as: :thank_you

  resources :categories, path: '/', only: [:index, :show] do
    resources :products, path: '/', only: [:show]
  end

end
