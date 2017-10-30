Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => 'user_registrations', :sessions => 'user_sessions', :passwords => 'user_passwords'}
  get 'stores' => 'stores#index'
  get 'store_campaigns/new'
  get 'campaign/edit/:id' => 'store_campaigns#edit', as: "campaign_edit"
  get 'store_campaigns/test'
  get 'page/index' => "page#index"
  post 'pages/submit' => "page#submit"
  get 'home/stores' => "home#stores"
  get '/stores/new' => "devise/registrations#new"
  get 'stores/settings' => 'stores#settings'
  get 'stores/secret' => 'stores#secret'
  put '/stores/update'
  get '/stores/activate/:id' => 'stores#activate', as: "store_activate"
  get '/users/sign_up' => 'stores#index'
  put '/store_campaigns/update_poll'
  get '/poll/view/:id' => 'poll_answers#show', as: "poll_view"
  get '/pages/phone' => 'page#phone'
  post '/pages/ticket' => 'page#ticket'
  get '/pages/code' => 'page#code'
  post 'tickets/verify' => 'tickets#verify'

  devise_scope :store do
    get 'home/new', to: 'store_registrations#new'
    get 'logout', to: 'store_registrations#destroy'
    get '/campaigns' => 'store_campaigns#index'
  end

  devise_scope :user do
    get 'users/new', to: 'user_registrations#new'
    get '/users/sign_up' => 'stores#index'

  end

  get 'pages/campaign' => "page#campaign"
  devise_for :stores, :controllers => { registrations: 'store_registrations', sessions:'store_sessions', :passwords => 'store_passwords'}
  #resources :stores
  root to: "stores#index"
  #devise_for :stores

  resources :pages
  resources :store_campaigns
  resources :polls
  resources :poll_answers
  resources :tickets
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '*path' => redirect('/')
end
