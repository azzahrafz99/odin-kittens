Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kittens
  root to: 'kittens#index'
  get '/search', to: 'flickrs#show'
  match '*a', to: 'kittens#routing', via: :get
end
