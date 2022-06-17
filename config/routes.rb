Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get 'customers/my_page' => 'public/customers#show'
  get '/customers/withdrawal' => 'public/customers#withdrawal'

  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  get 'about' => 'public/homes#about'
  get 'admin' => 'admin/homes#top'


  scope module: :public do
    resources :hoems
    resources :items
    resources :customers
    resources :cart_items
    resources :orders
    resources :addresses
  end


  namespace :admin do
    resources :genres
    resources :homes
    resources :items
    resources :customers
    resources :orders
    resources :order_details
  end
end