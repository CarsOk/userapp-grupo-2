Rails.application.routes.draw do
resources :user, only: [:index, :create, :show]
end
