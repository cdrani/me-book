# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validate :min_age
  validates :gender, length: 0..25
  validates :locale, length: 0..100
  validates :bio, length: 0..500
  validates :name, length: { minimum: 3 }

  def min_age
    if birthdate.blank? || birthdate < Date.today - 13.years
      errors.add(
        :birthdate, 'Minimum age requirement of 13 years old.'
      )
    end
  end
end
