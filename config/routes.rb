Rails.application.routes.draw do
  get '/productos/new', to: 'productos#new', as: :new_producto
  get '/productos', to: 'productos#index'
  get '/productos/:id', to: 'productos#show', as: :producto
end
