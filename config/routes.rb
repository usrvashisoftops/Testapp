Rails.application.routes.draw do
  root to: "home#index"
  get 'sign_in', :to => 'devise/sessions#new'
  devise_for :users, controllers: {sessions: "sessions", registrations: "registrations"}
  resources :questions, only: [:show, :index] 
  resource :follow_users, only: [:create]
  resource :follow_topics, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
