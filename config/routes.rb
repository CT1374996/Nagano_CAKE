Rails.application.routes.draw do
  devise_for :customers,skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about'
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information/update' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdrawal' => 'customers#withdrawal'
  end
  scope module: :admin do
    get 'admin' => 'homes#top'
    get 'admin/items/new' => 'admin#new'
    post 'admin/items' => 'admin#create'
    get 'admin/items' => 'admin#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
