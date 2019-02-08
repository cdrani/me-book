# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?, except: %i[show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :find_post_to_like, only: %i[like]

  def index
    @posts = if current_user.friends.present?
               Post.timeline.newest
             else
               current_user.posts
             end
  end

  def new
    @post = current_user.posts.new
  end

  def show; end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Successfully posted!'
      redirect_to profile_path(current_user.user_name) 
    else
      flash[:alert] = 'Post error.'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:success]: 'Post updated!'
      redirect_to profile_path(current_user.user_name)
    else
      flash[:alert] = 'Post not updated.'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted.'
    redirect_to posts_path
  end

  def like
    if already_liked?(@like_post)
      flash[:notice] = 'You have already liked this post! \
      Look for other posts to like.'
    else
      liked_post = @like_post.likes.build(user_id: current_user.id)
      if liked_post.save
        like = Like.find_by(post_id: @like_post.id)
        create_notification(@like_post, like)
      end
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

  def find_post_to_like
    @like_post = Post.find_by(id: params[:post_id])
  end

  def already_liked?(post)
    post.likes.to_a.any? { |like| like.user_id == current_user.id}
  end

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
  end


  def post_params
    params.require(:post).permit(:content)
  end
end
