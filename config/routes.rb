Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root "articles#index"
  resources :articles
  get '/my_articles', to: 'articles#my_articles', as: 'my_articles'
  get 'search_articles', to: 'articles#search', as: 'search_articles'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
