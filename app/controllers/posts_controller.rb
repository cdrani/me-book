# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?, except: %i[show]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.build
  end

  def show; end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path, success: 'Successfully posted!'
    else
      flash[:alert] = 'Post error.'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to user_posts_path, success: 'Post updated.'
    else
      flash[:alert] = 'Post not updated.'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path, success: 'Post deleted.'
  end

  private

  def set_post
    @post ||= current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
