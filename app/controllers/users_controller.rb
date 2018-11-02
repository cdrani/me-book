# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @not_friends_yet = User.not_my_friends(current_user)
    @pending_friends = current_user.pending_friends
    @requested_friends = current_user.requested_friends
    @friends = current_user.friends
  end
end
