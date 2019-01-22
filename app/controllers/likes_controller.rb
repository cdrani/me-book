# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post

  def create
    if already_liked?
      flash[:notice] = 'You have already like this post! \
      Look for other posts to like.'
    else
      @post.likes.create(user_id: current_user.id)
      create_notification(@post)
    end
    redirect_to posts_path
  end

  private

  def create_notification(post)
    return if post.user.id == current_user.id

    like = Like.where(post_id: post.id)

    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        identifier: like.id,
                        notice_type: 'like')
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
