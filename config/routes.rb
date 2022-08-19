Rails.application.routes.draw do
  get 'bookmarks/show'
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'movies/index'
  get 'movies/show'
  get 'movies/new'
  get 'movies/create'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "lists#index"
  resources :lists, only: [:new, :show, :create, :destroy] do
      resources :bookmarks, only: [:new, :show, :create]
    end

    resources :bookmarks, only: [:destroy]
end
