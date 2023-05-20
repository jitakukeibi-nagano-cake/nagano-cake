Rails.application.routes.draw do

namespace :admin do

  resources :customers, only:[:index, :show, :edit, :update]
  resources :orders, only:[:index, :show]

end

  scope module: :public do
    root to: 'homes#top'
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
