Rails.application.routes.draw do
  root to: "homes#top"
  get '/about' => 'homes#about', as: 'about'
  get '/mypage' => 'users#mypage'
  delete '/' => 'users#destroy', as: 'delete_user'
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
