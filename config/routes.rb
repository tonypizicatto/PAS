Rails.application.routes.draw do
  devise_for :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tasks
  end


  get 'dashboard/index'
  get 'about' => 'dashboard#about'
  get 'user' => 'user#index'
  get 'tasks' => 'tasks#index'


  root 'dashboard#index'



end
