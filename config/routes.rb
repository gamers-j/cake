Rails.application.routes.draw do
   devise_for :admins,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show,:update]
    resources :customers, only: [:show,:index,:edit,:update]
    resources :types, only: [:index,:create,:edit,:update]
    resources :products, except: [:destroy]
    resources :product_orders, only: [:update]
  end
  
  scope module: :public do
    root to: "homes#top"
    get 'homes/about'
    
    get "search" => "searches#search"
  
    resources :delivery_addresses, only: [:index,:edit,:create,:update,:destroy]

    get 'orders/complete'
    post 'orders/confirm'
    resources :orders, only: [:new,:create,:index,:show]
    
    
    delete 'cart_products/destroy_all'
    resources :cart_products, only: [:index,:update,:destroy,:create]
    
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers, only: [:show,:edit,:update]

    resources :products, only: [:index,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
