Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  get 'home' => "posts#index"
  post "tags/:id/follow_tags" => "follow_tags#create", as: "follow_tags"
  delete "tags/:id/follow_tags" => "follow_tags#destroy", as: "follow_tag"
  get "tags/ranking" => "tags#rank", as: "tags_rank"
  get '/posts/tag/:tag' => 'posts#tag', as: 'tag'
  get "search" => "search#search"
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index]
  resources :posts, only: [:create, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
