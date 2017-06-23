Rails.application.routes.draw do

  get 'page/index'

  get 'home/stores' => "home#stores"
  get '/stores/new' => "devise/registrations#new"

  get 'pages/campaign' => "page#campaign"
  devise_for :stores, :controllers => { registrations: 'store_registrations' }
  #resources :stores
  root to: "home#index"
  #devise_for :stores
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
