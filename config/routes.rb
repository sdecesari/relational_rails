Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/parks', to: 'parks#index'
  get 'parks/new', to: 'parks#new'
  post 'parks', to: 'parks#create'
  get '/parks/:id/edit', to: 'parks#edit'
  patch '/parks/:id', to: 'parks#update'
  get '/parks/:id', to: 'parks#show'
  get '/parks/:park_id/trails', to: 'park_trails#index'
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
end
