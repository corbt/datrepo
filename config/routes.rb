Datrepo::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }
  ActiveAdmin.routes(self)
  root to: redirect('/about')

  get '/about', to: 'high_voltage/pages#show', id: 'about'
  # get '/search', to: 'search#show'

  get '/popular', to: 'popular#index'

  resource :search, controller: :search, only: :show do
    get 'autocomplete'
  end

  resources :datasets do
    post 'favorite'
  end

  resources :collections do
    post 'favorite'
    post 'datasets'
  end

  resources :users, only: [:show]

  # http://collectiveidea.com/blog/archives/2013/06/13/building-awesome-rails-apis-part-1/
  namespace :api, defaults: {format: :json} do
    resources :datasets, only: [:show, :create, :update, :destroy]
    resources :users, only: [:show]
  end
end
