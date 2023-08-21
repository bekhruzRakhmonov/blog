# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# User.create!(
#     email: 'user1113@example.com',
#     name: 'User One',
#     image: 'https://via.placeholder.com/150',
#     password: '$2a$12$4LW0rgI/POXdVCIttmV5FOt6JJKEjQd8cqSnFcXgrVJaXrZqCkPSW',
#     encrypted_password: '$2a$12$4LW0rgI/POXdVCIttmV5FOt6JJKEjQd8cqSnFcXgrVJaXrZqCkPSW',
#     provider: 'email',
#     uid: 'user1_uid',
#     admin: false,
#     created_at: Time.now - 1.year
#   )
  
#   User.create!(
#     email: 'user2113@example.com',
#     name: 'User Two',
#     image: 'https://via.placeholder.com/150',
#     password: '$2a$12$4LW0rgI/POXdVCIttmV5FOt6JJKEjQd8cqSnFcXgrVJaXrZqCkPSW',
#     encrypted_password: '$2a$12$4LW0rgI/POXdVCIttmV5FOt6JJKEjQd8cqSnFcXgrVJaXrZqCkPSW',
#     provider: 'email',
#     uid: 'user2_uid',
#     admin: false,
#     created_at: Time.now - 6.months
#   )
  
#   User.create!(
#     email: 'admin113@example.com',
#     name: 'Admin User',
#     image: 'https://via.placeholder.com/150',
#     password: '$2a$12$4LW0rgI/POXdVCIttmV5FOt6JJKEjQd8cqSnFcXgrVJaXrZqCkPSW',
#     encrypted_password: '$2a$12$4LW0rgI/POXdVCIttmV5FOt6JJKEjQd8cqSnFcXgrVJaXrZqCkPSW',
#     provider: 'email',
#     uid: 'admin_uid',
#     admin: true,
#     created_at: Time.now - 3.months
#   )

# Create new posts with different dates
100.times do |i|
  Post.create!(
    title: "Post #{i + 1}",
    title_description: "First Blog",
    content: "This is the content of post #{i + 1}.",
    views: rand(1..300),
    created_at: Time.now - rand(1..300).days
  )
end
  

