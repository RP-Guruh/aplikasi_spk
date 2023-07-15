Rails.application.routes.draw do
  devise_for :users
 
 # get 'dashboards/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get '/dashboard', to: 'dashboards#index'

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
  get '/ranking/get_json', to: 'generate_ranking#get_json'
  
  get '/log/data_source', to: 'generate_ranking#log_data_source'
  get '/log/normalisasi', to: 'generate_ranking#log_normalisasi'
  get '/log/normalisasi_bobot', to: 'generate_ranking#log_normalisasi_bobot'
  get '/log/hasil_akhir', to: 'generate_ranking#log_hasil_akhir'
  
  # create report
  get 'generate_report/employee_report', to: 'generate_report#employee_report', as: 'generate_report_employee_report'

  get 'generate_report/hasil_report', to: 'generate_report#hasil_report'
  get 'generate_report/normalisasi_bobot', to: 'generate_report#normalisasi_bobot'
  get 'generate_report/normalisasi_report', to: 'generate_report#normalisasi_report'
  


end
