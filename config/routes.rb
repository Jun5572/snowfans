Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  get 'notification/:id/link_through' => 'notifications#link_through', as: 'link_through'
  get 'events/narrow_down' => 'events#narrow_down', as: 'narrow_down_events'
  get 'events/clip-lists' => 'events#check_lists', as: 'check_list_events'
  get 'users/:id/interests' => 'users#check_lists', as: 'check_list_user'
  get 'users/:id/joins' => 'users#join_lists', as: 'join_list_user'
resources :users do
  resources :events, only: [:show, :edit]
end

resources :events, except: [:show, :edit] do
	resources :comments, only: [:create]
  resource :join, only: [:create, :destroy]
  resource :interest, only: [:create, :destroy]
end
resources :comments, except: [:create]


# ルートパス指定。ログイン時
  root 'events#index'

# ルートパス指定。ログアウト時
  unauthenticated :user do
  	root :to => "devise/sessions#new"
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
