Rails.application.routes.draw do
  root 'sequence#input'
  post '/show', to: 'sequence#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
