ToDoApp::Application.routes.draw do
  resources :projects do
  	resources :items, :only => [:new, :index] do
  		collection do
  			post 'batch_update'
  		end
  	end
  end
  resources :items, :except => [:index, :new]
  resources :teams do
  	resources :projects, :only => [:new]
  	resources :users, :only => [:new]
  end
  resources :users
end
