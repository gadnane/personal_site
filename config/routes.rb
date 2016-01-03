Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  get 'static_pages/curricVitae'

  resources :posts

  resources :contacts, only: [:new, :create]

  get '*path' => redirect('/')

end
