Rails.application.routes.draw do


  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    root :to => "homes#top"
    get 'items/index'
    get 'about' =>  'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
    # get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    # patch 'customers/withdraw' => 'public/customers#withdraw'
    delete 'cart_items/destory_all' => 'cart_items#destroy_all'
    resources :cart_items, except: [:new,:show,:edit]
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders, only: [:new, :create, :index, :show]
    resources :adresses, except: [:new, :show]
  end
    namespace :admin do
      root :to => 'homes#top'
      resources :items, except: [:destroy]
      resources :customers, except: [:new, :destroy, :create]
      resources :genres, except: [:new, :destroy, :show]
      resources :order_items, only: [:show, :edit, :update]
      resources :orders, only: [:show, :update]
  end


end
