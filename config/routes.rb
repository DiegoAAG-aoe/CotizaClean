Rails.application.routes.draw do
  delete '/productos/:id', to: 'productos#destroy'
  patch '/productos/:id', to: 'productos#update'
  post '/productos', to: 'productos#create'
  get '/productos/new', to: 'productos#new', as: :new_producto
  get '/productos', to: 'productos#index'
  get '/productos/:id', to: 'productos#show', as: :producto
  get '/productos/:id/edit', to: 'productos#edit', as: :edit_producto
end
