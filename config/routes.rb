Rails.application.routes.draw do
  devise_for :users
  resources :projects

  scope "/tasks" do
    get'/new', to: 'tasks#quick_new_task', as: "quick_new_task"
    post'/', to: 'tasks#create', as: "post_quick_new_task"
    get'/all-active-tasks', to: 'tasks#all_active_tasks', as: "all_active_tasks"
    get'/all-complete-tasks', to: 'tasks#all_complete_tasks', as: "all_complete_tasks"
    get'/all-overdue-tasks', to: 'tasks#all_overdue_tasks', as: "all_overdue_tasks"
end
  root "projects#index"
end
