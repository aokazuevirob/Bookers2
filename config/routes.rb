Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "/home/about" => "homes#about", as:"about"
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :index, :show, :edit, :update]

end
