class CommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      redirect_to request.referer
      flash[:comment_error] = "コメントが入力されていません"
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to post_path(params[:post])
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
