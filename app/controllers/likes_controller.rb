# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post

  def create
    if already_liked?
      flash[:notice] = 'You have already like this post! \
      Look for other posts to like.'
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to user_posts_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
