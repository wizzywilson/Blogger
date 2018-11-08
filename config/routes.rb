Rails.application.routes.draw do
  get 'home/index'
  resources :microposts
  get 'home/search', to: 'home#search'
  delete '/destroy_user', to: 'home#destroy_user'
  post '/add_admin', to: 'home#add_admin'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
