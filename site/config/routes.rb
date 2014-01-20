Datrepo::Application.routes.draw do
  root to: redirect('/about')

  get '/about', to: 'high_voltage/pages#show', id: 'about'

end
