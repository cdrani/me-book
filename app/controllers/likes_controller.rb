# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to user_post_path @post
  end

  private

  def find_post
    @post = Post.find(param[:post_id])
  end
end
