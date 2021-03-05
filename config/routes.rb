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
  resources :reports, only: [:index]

  get 'reports/all_users_tasks'
  get 'reports/tasks_in_projects'
  get 'dashboard/index'
  get 'dashboard/no_access'
  get 'about' => 'dashboard#about'
  get 'user' => 'user#index'
  get 'user_tasks' => 'tasks#user_tasks'

  root 'dashboard#index'

end
