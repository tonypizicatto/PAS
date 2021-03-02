Rails.application.routes.draw do
  devise_for :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tasks
  end
  resources :comments
  resources :teams
  namespace :user do
    post :tasks, to: 'tasks#index'
    resources :tasks, only: [:index, :show]
  end

  get 'dashboard/index'
  get 'about' => 'dashboard#about'
  get 'user' => 'user#index'
  get 'user_tasks' => 'tasks#user_tasks'

  root 'dashboard#index'

end
