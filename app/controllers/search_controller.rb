class SearchController < ApplicationController
  
  def search
    @posts = Post.joins(:tags).where(tags:{ name: "#{params[:keyword]}"}).distinct.order(created_at: :desc)
  end
  
end
