Rails.application.routes.draw do
  resources :scenarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :likes
  resources :characters
  resources :pixes
end
