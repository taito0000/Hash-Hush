class FollowTagsController < ApplicationController
  
  def create
    tag = Tag.find(params[:id])
    follow_tag = current_user.follow_tags.new(tag_id: tag.id)
    follow_tag.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    tag = Tag.find(params[:id])
    follow_tag = current_user.follow_tags.find_by(tag_id: tag.id)
    follow_tag.destroy
    redirect_back(fallback_location: root_path)
  end
end
