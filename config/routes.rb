NycCyclingApp::Application.routes.draw do

  root 'collisions#index'

  resources :collisions, only: [:index]

end
