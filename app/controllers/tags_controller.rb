class TagsController < ApplicationController
  
  def rank
    @tag_post_ranks = Tag.find(PostTag.group(:tag_id).order('count(tag_id)desc').limit(5).pluck(:tag_id))
  end
end
