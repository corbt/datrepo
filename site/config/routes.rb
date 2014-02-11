Datrepo::Application.routes.draw do

  devise_for :users
  ActiveAdmin.routes(self)
  root to: redirect('/about')

  get '/about', to: 'high_voltage/pages#show', id: 'about'

  resources :datasets do
    collection do
      get 'popular'
      get 'search'
      get 'autocomplete'
    end
  end

  resources :users, only: [:show] do 
    get 'datasets'
    get 'following'
  end
end
