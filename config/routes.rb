Rails.application.routes.draw do
  resources :articles, path: "/"
  
  get '/404', to: 'errors#not_found', as: :not_found
  root "articles#index"
end
