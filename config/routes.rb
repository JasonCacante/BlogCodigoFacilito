Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: 'home#index'

  resources :users, only: [:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenido", to: "home#index"
  # Solo con una línea podemos remplazar todo el proceso que amostramos abajo. Esto solo funciona con 
  # modelos en los que tengamos que usar todo el CRUD.
  # get "/articles/new", to: "articles#new", as: :new_articles
  # post "/articles", to: "articles#create"
  # get "/articles/:id", to: "articles#show"
  # get "/articles/:id/edit", to: "articles#edit"
  # patch "/articles/:id", to: "articles#update", as: :article
  # delete "articles/:id", to: "articles#destroy"
  # get "/articles", to: "articles#index"
  #get "/articles/user/:user_id", to: "articles#from_author"
  get "perfil", to: "users#edit"
  resources :articles do 
    get "user/:user_id", to: "articles#from_author", on: :collection
  end
end
