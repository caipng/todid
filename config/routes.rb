Rails.application.routes.draw do
  namespace :auth do
    post 'signup', to: 'users#create'
    get 'me', to: 'users#show'
    post 'login', to: 'users#login'
  end
end
