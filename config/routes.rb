Rails.application.routes.draw do
  
  get 'stores' => 'stores#index'

  get 'store_campaigns/new'

  get 'store_campaigns/edit'

  get 'page/index' => "page#index"
  post 'pages/submit' => "page#submit"

  get 'home/stores' => "home#stores"
  get 'home/campaigns' => "home#campaigns"
  get '/stores/new' => "devise/registrations#new"

  get 'pages/campaign' => "page#campaign"
  devise_for :stores, :controllers => { registrations: 'store_registrations' }
  #resources :stores
  root to: "stores#index"
  #devise_for :stores
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :pages
  resources :store_campaigns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
