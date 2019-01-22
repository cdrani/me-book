# frozen_string_literal: true

class User < ApplicationRecord
  after_commit :add_profile_skeleton
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, length: 4..12

  has_friendship
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def add_profile_skeleton
    profile = Profile.new
    profile.user_id = id
    profile.save
  end

  scope :not_my_friends, ->(current_user) {
    where
      .not(id: current_user.id)
      .where.not(id: current_user.friend_ids)
      .where.not(id: current_user.requested_friend_ids)
      .where.not(id: current_user.pending_friend_ids)
  }
end
