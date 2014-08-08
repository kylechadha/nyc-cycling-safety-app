NycCyclingApp::Application.routes.draw do

  root 'collisions#map'

  get 'collisions/map', :to => "collisions#map"
  resources :collisions, only: [:index]

  resources :intersections, only: [:index]

end
