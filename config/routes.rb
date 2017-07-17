Rails.application.routes.draw do
  use_doorkeeper
  resources :blogs
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root "blogs#index"

  devise_for :users

  resources :users

  mount Session::Login => "/api"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
