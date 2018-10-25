# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :user_signed_in?, except: %i[show]
  before_action :set_post, only: %i[show edit destroy]

  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.build
  end

  def show; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user_path, success: 'Successfully posted!'
    else
      flash[:alert] = 'Post error.'
      render :new
    end
  end

  def edit
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post ||= current_user.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
