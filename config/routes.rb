Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :articles
  get '/my_articles', to: 'articles#my_articles', as: 'my_articles'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
