NycCyclingApp::Application.routes.draw do

  root 'collisions#index'

  get 'collisions/map', :to => "collisions#map"
  resources :collisions, only: [:index]

  resources :intersections, only: [:index]

end
