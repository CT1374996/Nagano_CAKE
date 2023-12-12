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
    get 'customers/mypage/edit' => 'customers#edit'
    patch 'customers/mypage' => 'customers#update'
  end
  scope module: :admin do
    get 'admin' => 'homes#top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
