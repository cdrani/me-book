# frozen_string_literal: true

users = %w[alpha beta gamma omega]

users.each do |user|
  name = User.create(
    user_name: user,
    email: "#{user}@test.com",
    password: user * 2,
    password_confirmation: user * 2
  )

  name.posts.create(
    content: "#{user.capitalize} is a letter in the Greek alphabet."
  )
end
