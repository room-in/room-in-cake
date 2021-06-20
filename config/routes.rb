Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'
  resources :cart_items, except: [:new,:show,:edit]
  delete 'cart_items/destory_all' => 'public/cart_items#destroy_all'
  get 'orders/complete' => 'orders#complete'
  resources :orders, only: [:new, :create, :index, :show]

  post 'orders/confirm' => 'public/orders#confirm'
  resources :address, except: [:new, :show]
  namespace :admin do
    get 'homes' => 'admin/homes#top'
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :destroy, :create]
    resources :genres, except: [:new, :destroy, :show]
    resources :order_items, only: [:show, :edit, :update]
  end


end
