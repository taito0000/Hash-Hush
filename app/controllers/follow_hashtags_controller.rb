class FollowHashtagsController < ApplicationController
  
  def create
    hashtag = Hashtag.find(params[:id])
    follow_hashtag = current_user.follow_hashtags.new(hashtag_id: hashtag.id)
    follow_hashtag.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    hashtag = Hashtag.find(params[:id])
    follow_hashtag = current_user.follow_hashtags.find_by(hashtag_id: hashtag.id)
    follow_hashtag.destroy
    redirect_back(fallback_location: root_path)
  end
end
