Rails.application.routes.draw do
  
namespace :admin do
root to: 'homes#top'
  resources :items, only:[:index, :new, :create, :show, :edit, :update]
  resources :customers, only:[:index, :show, :edit, :update]

end

  scope module: :public do
    resources :items, only: [:index, :show]
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