Rails.application.routes.draw do
  
  namespace :admin do
    root to: 'homes#top'
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
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
