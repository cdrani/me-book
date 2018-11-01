# frozen_string_literal: true

# # frozen_string_literal: true

# users = %w[alpha beta gamma omega]
# real_names = ['Wally Green', 'Sam Dear', 'Kate Weary', 'Brett Tinelli']

# users.each_with_index do |user, index|
#   name = User.create(
#     user_name: user,
#     email: "#{user}@test.com",
#     password: user * 2,
#     password_confirmation: user * 2
#   )

#   Profile.create(user_id: index + 1, bio: 'I love bookie', locale: 'Canada', gender: index.even? ? 'Male' : 'Female', name: real_names[index], birthdate: 18.years.ago)

#   name.posts.create(
#     content: "#{user.capitalize} is a letter in the Greek alphabet."
#   )
# end
