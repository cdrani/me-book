# frozen_string_literal: true

module ApplicationHelper
  def profile_avatar_select(user)
    return image_tag user.avatar.variant(resize: '96x96!') if user.avatar.attached?

    image_tag 'default_avatar.png', width: 96, height: 96
  end

  def friend_labels(user)
    label = 'Pending' if current_user.pending_friends.includes(user)
    label = 'Requested' if current_user.requested_friends.includes(user)
    "<p>#{label}</p>".html_safe
  end
end
