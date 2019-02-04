# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post, only: [:like]

  def like
    if already_liked?
      flash[:notice] = 'You have already liked this post! \
      Look for other posts to like.'
    else
      @post.likes.create(user_id: current_user.id)
      like = Like.where(post_id: @post.id)
      create_notification(@post, like)
    end
  end

  private

  def create_notification(post, like)
    return if post.user.id == current_user.id

    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        identifier: like.id,
                        notice_type: 'like')
  end

  def find_post
    @post = Post.find(id: params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
