# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      create_notifcation(@post, @comment)
      flash[:success] = 'Comment successfully posted!'
      redirect_to posts_path
    else
      flash[:alert] = 'Comment could not be added to post.'
      render @post
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    return if @comment.user_id != current_user.id

    @comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def create_notifcation(post, comment)
    return if post.user.id == current_user.id

    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        identifier: comment.id,
                        notice_type: 'comment')
  end
end
