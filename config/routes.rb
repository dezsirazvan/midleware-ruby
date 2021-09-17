Rails.application.routes.draw do
  resources :welcome, only: [:index]
end
