# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def current_user_path
    profile_path(current_user.user_name) 
  end
end
