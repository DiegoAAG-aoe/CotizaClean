Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :favoritos, only: [:index, :create, :destroy], param: :producto_id
  resources :categories, except: :show
  resources :productos, path: '/productos'

  post '/search', to: 'search#results'
end
