ToDoApp::Application.routes.draw do
  resources :projects
  resources :items
  resources :teams do
  	resources :projects, :only => [:new]
  end
  resources :users
end
