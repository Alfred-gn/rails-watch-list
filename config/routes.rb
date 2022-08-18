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
  resources :lists, only: [:new, :show, :create, :index, :destroy] do
    resources :movies, only: [:new, :show, :create, :destroy ,:index] do
      resources :bookmarks, only: [:new, :show, :create]
    end
  end
end
