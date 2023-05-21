Rails.application.routes.draw do

namespace :admin do
    root to: 'homes#top'
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show]
    resources :genres, only:[:index, :edit, :create, :update]

end

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers, only: [:show, :update, :edit]
    get "quit" => "customers#quit", as: "quit_customer"
    patch "out" => "customers#out", as: "out_customer"
    resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end

  # 顧客用
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

end