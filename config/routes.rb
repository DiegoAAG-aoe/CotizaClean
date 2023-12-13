Rails.application.routes.draw do
  get '/productos', to: 'productos#index'
  get '/productos/:id', to: 'productos#show', as: :producto
end
