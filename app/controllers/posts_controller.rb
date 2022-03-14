class PostsController < ApplicationController
    
    def new
      @new_post = Post.new
    end
    
    def create
      @new_post = Post.new(post_params)
      @new_post.user_id = current_user.id
      @new_post.save
      redirect_to posts_path
    end
    
    def index
      @posts = Post.joins(:post_hashtags).where(post_hashtags: {hashtag_id: current_user.hashtags.ids}).uniq
    end
    
    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
      @hashtags = @post.hashtags
    end
    
    def hashtag
      @posts = Hashtag.find_by(name: params[:tag]).posts
      @hashtag = Hashtag.find_by(name: params[:tag])
    end
    
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
    
    private
    
    def post_params
      params.require(:post).permit(:body, :image, :hashbody)
    end
end
