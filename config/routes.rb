Rails.application.routes.draw do
  devise_for :users
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks, :projects


  get 'dashboard/index'
  get 'about' => 'dashboard#about'
  get 'signup'  => 'users#new'



  root 'dashboard#index'



end
