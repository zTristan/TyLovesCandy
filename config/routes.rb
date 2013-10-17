TyLovesCandy::Application.routes.draw do
  %w[rankings how_to_play].each do |page|
    get page, controller: 'info', action: page
  end

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  post "give_candy" => "candies#give_candy", :as => "give_candy"
  resources :users
  resources :sessions
  resources :uploads
  resources :comments
  resources :photos
  resources :videos
  root :to => 'welcome#index'
end
