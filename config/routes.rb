Rails.application.routes.draw do
  root to: "items#index"
  get "/" => 'items#top'
 resources :items, only: :index
end
