Rails.application.routes.draw do

  get '/sign_in' => 'users#login_form', as: :sign_in_user
  post '/request_token' => 'users#request_token'
  post '/sign_in' => 'users#login'
  get '/sign_out' => 'users#logout', as: :sign_out_user

  resources :org_admins, module: "org_admins" do
    resources :dashboard, only: [:index]
  end

  resources :admins, module: "admins" do
    resources :dashboard, only: [:index]
  end

  resources :customers, module: "customers" do
    resources :dashboard, only: [:index]
  end

  resources :organizations, only: [:show], module: "organizations" do
    resources :projects, only: [:index, :show, :edit, :update, :new, :create]
  end

  resources :projects, only: [:index, :show]
  get '/finance/project/:id' => 'projects#finance', as: :finance_project

  resources :categories, only: [:index]

  get "organizations", to: "pages#organizations"
  
  root to: "pages#home"
  get 'about', to: "pages#about"
end
