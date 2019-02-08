# frozen_string_literal: true

module ApplicationHelper
  def profile_avatar_select(user)
    return image_tag user.avatar.variant(resize: '128x128!') if user.avatar.attached?

    image_tag 'default_avatar.png', width: 128, height: 128 
  end

  def notification_formatter(notification) 
    type = notification.notice_type
    name = notification.notified_by.user_name.capitalize

    case type
    when 'like'
      "#{name} liked your post"
    else
      "#{name} #{type}ed on your post"
    end
  end

  def alert_for(flash_type)
    {success: 'is-success', 
     alert: 'is-danger'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def alert_prefix(flash_type)
    flash_type.to_s == 'success' ? 'Success!' : 'Alert!'
  end
end
