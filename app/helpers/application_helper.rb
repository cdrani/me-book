# frozen_string_literal: true

module ApplicationHelper
  def profile_avatar_select(user)
    return image_tag user.avatar.variant(resize: '128x128!') if user.avatar.attached?

    image_tag 'default_avatar.png', width: 128, height: 128 
  end
end
