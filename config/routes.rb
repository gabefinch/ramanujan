Rails.application.routes.draw do
  devise_for :users
  resources :messages, :only => [:index, :new, :create, :show]
  root :to => 'home#index'
end
