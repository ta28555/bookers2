Rails.application.routes.draw do

  # 名前ログイン機能
  devise_for :users

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :books
  resources :users



end
