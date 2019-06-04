

Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
    namespace :api do

        namespace :v1 do

          resources :users

          resources :friend_requests

          post '/login', to: 'auth#create'

          get '/current_user', to: 'auth#show'
  end
  end
end
