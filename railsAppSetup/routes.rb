Rails.application.routes.draw do
  root :to => "catalog#index"

  get "imageviewer/:id/:type" => "imageviewers#index"

  # ## For handling pages
  #get '/about'        => 'pages#about'

  blacklight_for :catalog
  devise_for :users

end
