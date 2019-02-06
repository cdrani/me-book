# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: 'User'
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :notified_by_id, presence: true
  validates :post_id, presence: true
  validates :identifier, presence: true
  validates :notice_type, presence: true

  def to_s
    display_name
  end
end
