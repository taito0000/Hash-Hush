class FavoritesController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to request.referer
    # path = Rails.application.routes.recognize_path(request.referer)
    # if path[:controller] == "posts"&& path[:action] == "index"
    #   redirect_to posts_path
    # else
    #   redirect_to post_path(post.id)
    # end
    # puts request.referer
  end
  
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
