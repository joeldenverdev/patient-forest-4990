Rails.application.routes.draw do
  get '/studios', to: 'studios#index'

  get '/movies/:id', to: 'movies#show'
  patch '/movies/:id', to: 'movies#update'
end
