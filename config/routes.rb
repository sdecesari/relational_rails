Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/parks', to: 'parks#index'
  get '/parks/new', to: 'parks#new'
  post '/parks', to: 'parks#create'
  get '/parks/:id', to: 'parks#show'
  get '/parks/:id/edit', to: 'parks#edit'
  delete '/parks/:id', to: 'parks#destroy'
  patch '/parks/:id', to: 'parks#update'

  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
  get '/trails/:id/edit', to: 'trails#edit'
  patch '/trails/:id', to: 'trails#update'
  delete '/trails/:id', to: 'trails#destroy'

  get '/parks/:park_id/trails/new', to: 'park_trails#new'
  post '/parks/:park_id/trails', to: 'park_trails#create'
  get '/parks/:park_id/trails', to: 'park_trails#index'
end
