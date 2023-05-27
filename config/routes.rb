Rails.application.routes.draw do
 
 # get 'dashboards/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'dashboards#index'

  # Employee route
  get '/employee', to: 'employees#index'
  post '/employee', to: 'employees#create'
  delete '/employee', to: 'employees#destroy'
  get '/employee/:id/edit', to: 'employees#edit'
  patch '/employees/:id', to: 'employees#update', as: 'update_employee'

  # Criteria route
  get '/criteria', to: 'criteria#index'
  post '/criteria', to: 'criteria#create'
  delete '/criteria', to: 'criteria#destroy'
  get '/criteria/:id/edit', to: 'criteria#edit'
  patch '/criteria/:id', to: 'criteria#update', as: 'update_criteria'

  #Preference Value Route
  get '/preference', to: 'preference_value#index'
  post '/preference', to: 'preference_value#create'
  delete '/preference', to: 'preference_value#destroy'
  get '/preference/:id/edit', to: 'preference_value#edit'
  patch '/preference/:id', to: 'preference_value#update', as: 'update_preference'

  #create ranking
  get '/ranking', to: 'generate_ranking#index'
  post '/ranking', to: 'generate_ranking#create'
  get '/generate_rank/:id', to: 'generate_ranking#generate_rank'
  get '/ranking_data', to: 'generate_ranking#rank_all_data'
  get '/ranking/normalisasi', to: 'generate_ranking#normalisasi'
  get '/ranking/data/normalisasi', to: 'generate_ranking#normalisasiData'
  get '/ranking/data/bobot', to: 'generate_ranking#normalisasiBobot'
  get '/ranking/data/akhir', to: 'generate_ranking#hasilAkhir'
  
end
