# frozen_string_literal: true

class Profile < ApplicationRecord
  before_create :set_default_images
  belongs_to :user

  has_one_attached :avatar
  has_one_attached :cover

   validates :birthdate, presence: true, allow_blank: true
   validates :gender, length: 0..25, allow_blank: true
   validates :locale, length: 0..100, allow_blank: true
   validates :bio, length: 0..500, allow_blank: true
   validates :name, allow_blank: true, length: { minimum: 3 }
   validate :validate_age

  private

  def validate_age
    if birthdate.present? && birthdate > 13.years.ago.to_date
      errors.add(
        :birthdate, 'Minimum age requirement of 13 years old.'
      )
    end
  end

  def set_default_images
    pics = rand(1...5)
    avatar.attach(io: File.open(
      Rails.root.join('app', 'assets', 'images', 'default_avatar.png')
    ), filename: 'default_avatar.png', content_type: 'image/png')

    cover.attach(io: File.open(
      Rails.root.join('app', 'assets', 'images',
                      "fb_cover_#{pics}.jpg")
    ), filename: "fb_cover_#{pics}.jpg", content_type: 'image/jpg')
  end
end
