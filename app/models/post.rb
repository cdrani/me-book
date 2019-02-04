# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true, null: false
  validates :user_id, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  scope :timeline, -> { joins(:user, user: [:friends]).distinct }
  scope :newest, -> { order(created_at: :desc) }
end
