# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_user, only: %i[new create show edit update]

  def show
    @profile = @user.profile
    @posts = Post.timeline.newest
  end

  def edit
    @profile = @user.profile
  end

  def create
    profile = @user.profile.build(profile_prams)
    if profile.save
      redirect_to profile_path(@user.user_name), success: 'Profile added.'
    else
      render :new
    end
  end

  def update
    if @user.profile.update(profile_params)
      flash[:success] = 'Profile updated!'
      redirect_to profile_path(@user.user_name)
    else
      render :edit
    end
  end

  private

  def profile_params
    params
      .require(:profile)
      .permit(:name,
              :bio,
              :locale,
              :birthdate,
              :gender,
              :avatar,
              :cover)
  end

  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end
end
