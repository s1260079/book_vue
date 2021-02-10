Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api ,{format: 'json'} do
    resources :books, only: [:index,:show,:create,:update,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
