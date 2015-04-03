Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  resources :messages, :only => [:index, :new, :create, :show]
  resources :numbers
  get 'home', to: "home#user"
end
