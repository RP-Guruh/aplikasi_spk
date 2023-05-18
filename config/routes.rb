Rails.application.routes.draw do
 
 # get 'dashboards/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'dashboards#index'

  get '/employee', to: 'employees#index'
  post '/employee', to: 'employees#create'
  delete '/employee', to: 'employees#destroy'
end
