TyLovesCandy::Application.routes.draw do
  %w[rankings how_to_play].each do |page|
    get page, controller: 'info', action: page
  end

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  resources :uploads
  resources :photos
  resources :videos
  root :to => 'welcome#index'
end
