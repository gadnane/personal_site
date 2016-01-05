Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  get 'cv' => 'static_pages#curricVitae'


  resources :posts

  resources :projects

  resources :contacts, only: [:new, :create]

  # get '*path' => redirect('/')

  

  devise_scope :user do
  	get 'login' => 'devise/sessions#new'
  	post 'login' => 'devise/sessions#create'
  end

end
