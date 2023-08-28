Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/users/list', to: 'users#list'
  get '/users/show/:id', to: 'users#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
