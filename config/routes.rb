Rails.application.routes.draw do
  root "staticpages#home"
  get "/signup", to: 'users#new'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :activities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
