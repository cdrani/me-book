# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_friend, only: %i[add_friend request_friend]

  def index
    @not_friends_yet = User.not_my_friends(current_user)
    @pending_friends = current_user.pending_friends
    @requested_friends = current_user.requested_friends
    @friends = current_user.friends
  end

  def add_friend
    return unless current_user.accept_request(@friend)

    flash[:success] = "#{@friend.user_name} added to friends list"
  end

  def request_friend
    return unless current_user.friend_request(@friend)

    flash[:success] = "Friend request sent to #{@friend.user_name}"
  end

  private

  def set_friend
    @friend = User.find_by(id: params[:id])
  end

  def friend_params
    params.permit(:id)
  end
end
