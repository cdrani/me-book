class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :subscribe_user
  belongs_to :post
end
