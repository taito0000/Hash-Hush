Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  get 'home' => "posts#index"
  post "hashtags/:id/follow_hashtags" => "follow_hashtags#create", as: "follow_hashtags"
  delete "hashtags/:id/follow_hashtags" => "follow_hashtags#destroy", as: "follow_hashtag"
  get '/posts/hashtag/:tag' => 'posts#hashtag', as: 'hashtag'
  get "search" => "search#search"
  resources :users, only: [:show, :edit, :update]
  resources :timelines, only: [:index]
  resources :posts, only: [:new, :create, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
