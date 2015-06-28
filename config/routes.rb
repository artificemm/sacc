# require 'sidekiq/web'
Rails.application.routes.draw do

  namespace :admin do 
    resources :users
    resources :clients
    root to: "pages#dashboard"
  end

  resources :dossiers
  resources :location_information
  resources :nominal_work_record
  resources :spouse_work_record

  match "dossier" => "dossiers#documentize", as: :documentize_client, via: :post
  match "phones" => "clients#update_phones", as: :updtae_client_phones, via: :put
  match "credit" => "clients#update_credit", as: :updtae_client_credit, via: :put

  resources :interactions
  resources :messages
  resources :appointments do
    get 'client', on: :collection
  end
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :clients

  get 'pages/dashboard'
  get 'pages/help'
  get 'pages/about'

  root to: 'pages#dashboard'

  # mount Sidekiq::Web, at: '/sidekiq'
end
