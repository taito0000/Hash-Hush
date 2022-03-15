class SearchController < ApplicationController
  
  def search
    @posts = Post.joins(:hashtags).where(hashtags:{ name: "#{params[:keyword]}"}).distinct.order(created_at: :desc)
  end
  
end
