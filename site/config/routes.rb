Datrepo::Application.routes.draw do

  devise_for :users
  ActiveAdmin.routes(self)
  root to: redirect('/about')

  get '/about', to: 'high_voltage/pages#show', id: 'about'
  # get '/search', to: 'search#show'

  resource :search, controller: :search, only: :show do
    get 'autocomplete'
  end

  # scope '/search' do
  #   get '' to 'search#'
  # end

  resources :datasets do
    collection do
      get 'popular'
    end
  end

  resources :users, only: [:show] do 
    get 'datasets'
    get 'following'
  end
end
