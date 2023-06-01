Rails.application.routes.draw do
  
  post "/auth/login", to: "authentication#login"

  post "/excel", to: "excel#update"
  post "/excel_graduados", to: "excel#updategraduados"
  resources :users
  resources :students
  resources :admins
  resources :graduates
end
