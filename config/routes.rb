Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :teas, only: [:create]
      resources :customers, only: [:create]
    end
  end
end
