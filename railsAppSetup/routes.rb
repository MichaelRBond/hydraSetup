Rails.application.routes.draw do
  root :to => "catalog#index"

  get "imageviewer/:id/:type" => "imageviewers#index"

  blacklight_for :catalog
  devise_for :users

end
