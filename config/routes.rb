Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'scenarios#index'
  resources :characters
  resources :likes
  resources :pixes
  resources :scenarios
end
