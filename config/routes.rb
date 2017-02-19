Rails.application.routes.draw do
  root 'destinations#index'
  resources :destinations

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :destinations
    end
  end
end
