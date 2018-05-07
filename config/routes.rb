Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:create, :edit, :new, :show, :index, :update]
      resources :rounds, only: [:create, :edit, :new, :show, :index, :update]
    end
  end
end
