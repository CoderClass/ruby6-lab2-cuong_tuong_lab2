Rails.application.routes.draw do
  root 'welcome#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post 'sessions' => 'sessions#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
