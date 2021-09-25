Rails.application.routes.draw do
  root to: 'home#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenido", to: "home#index"
  get "/articles/new", to: "articles#new"
  post "/articles", to: "articles#create"
  get "/articles/:id", to: "articles#show"
  get "/articles/:id/edit", to: "articles#edit"
  patch "/articles/:id", to: "articles#update", as: :article
  delete "articles/:id", to: "articles#destroy"
  get "/articles", to: "articles#index"
end
