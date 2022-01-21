Rails.application.routes.draw do
  get 'users/reset', to: 'users#reset'
  get 'users/login', to: 'users#login'
  devise_for :users, controllers: { sessions: "sessions" }
  resources :users, except: [:show]
  root 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
