Datrepo::Application.routes.draw do

  devise_for :users
  ActiveAdmin.routes(self)
  root to: redirect('/about')

  get '/about', to: 'high_voltage/pages#show', id: 'about'

end
