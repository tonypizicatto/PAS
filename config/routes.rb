Rails.application.routes.draw do
  devise_for :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tasks
  end
  resources :comments

  get 'dashboard/index'
  get 'about' => 'dashboard#about'
  get 'user' => 'user#index'
  get 'user_tasks' => 'tasks#user_tasks'

  root 'dashboard#index'

end
