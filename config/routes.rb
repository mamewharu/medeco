Rails.application.routes.draw do
  root to: "messages#index"
  resources :rooms, only: [:create, :new]
end
