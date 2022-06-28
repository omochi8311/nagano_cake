Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get '/admin' => 'admin/homes#top'
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post '/orders/confirmation' => 'public/orders#confirmation'
  get '/orders/completion' => 'public/orders#completion'


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
    resources :cart_items
    resources :orders
    resources :addresses
    get '/customers/my_page' => 'customers#show'
    get '/customers/withdrawal' => 'customers#withdrawal'
    get '/customers/my_page/edit' => 'customers#edit'
    patch '/customers/update' => 'customers#update'
    patch '/customers/quit' => 'customers#quit'
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