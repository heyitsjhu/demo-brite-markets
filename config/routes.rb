Rails.application.routes.draw do

  root 'welcome#index'
  resources :subscribers, only: :create
end
