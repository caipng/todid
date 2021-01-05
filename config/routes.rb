Rails.application.routes.draw do
  resources :todos
  namespace :auth do
    post 'signup', to: 'users#create'
    get 'me', to: 'users#show'
    post 'login', to: 'users#login'
  end
end
