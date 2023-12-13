Rails.application.routes.draw do
  resources :categories, except: :show
  resources :productos, path: '/'
end
