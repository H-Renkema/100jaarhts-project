Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_for :admins, controllers: { sessions: "admins/sessions" }

  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  namespace :admins do
    root 'pages#index'
    get '/photoalbums' => 'photoalbums#index'
    get '/persondata' => 'pages#json_query'
    resources :photoalbums
    resources :news
    resources :schedules
  end

  resources :photoalbums do
    resources :photos #nested routes
  end

#DUTCH LANGUAGE URL's
  get '/fotoalbums' => 'photoalbums#index'
  get '/fotoalbums/:id' => 'photoalbums#show', :as => 'show_fotoalbum'
  get '/klassenfoto' => 'groupphotos#index'
  get '/klassenfoto/generate' => 'groupphotos#generate'
  get '/klassenfoto/nieuw' => 'groupphotos#request_one_group_photo'
  post 'klassenfoto/generate_single' => 'groupphotos#generate_one'
  get '/klassenfoto/:q' => 'groupphotos#public_index'



  resources :pages

  get 'process/new' => 'process#new'
  post 'process/update_config' => 'process#update_settings'
  post 'process/new' => 'process#create'
  get 'process/check_person' => 'process#check_person'
  post 'process/create_person' => 'process#create_person'
  get 'process/read_pictures' => 'process#read_pictures'
  get '/pof' => 'pof#index'
  root 'pages#index'
 end
