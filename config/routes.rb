Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  get 'welcome/index'
 root 'welcomes#index'
  get 'welcome/cart' => 'product#cart'
  devise_for :users
  resources :products do 
  resources :comments
  end
  resources :orders_items
  post "checkout/create", to: "checkout#create"
  get'search',to:"products#search"
  post 'products/add_to_cart:id', to: "products#add_to_cart", as: 'add_to_cart'
  delete'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart' 
  

 
   resources :carts
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
