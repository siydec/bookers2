Rails.application.routes.draw do


  get 'books/show'
  get 'books/index'
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
