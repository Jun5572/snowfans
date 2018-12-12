Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/edit'
  devise_for :users
  get 'users/show' => 'users#show'

  resources :events

  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
