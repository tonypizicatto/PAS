Rails.application.routes.draw do
  devise_for :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  resources :projects do
    resources :tasks
  end


  get 'dashboard/index'
  get 'about' => 'dashboard#about'
  get 'user' => 'user#index'


  root 'dashboard#index'



end
