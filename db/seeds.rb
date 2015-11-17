# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Cleanup Begin
Subscription.destroy_all
Course.destroy_all
User.destroy_all
# Cleanup end


Course.create!(name: 'Understand - GOT', content: 'Understand the this TV show in only 40 days', price: 39, image: File.open(Rails.root.join('db/seeds/images/GOT.jpeg') ) )
Course.create!(name: 'Understand - Premier - League', content: 'Become a real English Fan within 40 days' ,price: 49)
Course.create!(name: 'Understand - Premier - Challenge', content: 'Become a real English Fan within 40 days' ,price: 49 )
Course.create!(name: 'Understand - Premier - UEFA', content: 'Become a real English Fan within 40 days' ,price: 49 )



# course_got = Course.create!(
#   name: "GOT",
#   picture: File.open(Rails.root.join('db/seeds/images/GOT.jpeg'))

# )

# lesson_got_1 = course_got.lessons.create!(
#   name: "GOT Lesson 1"
# )

# user = User.create!(
#   email: "test@example.com",
#   password: "12345678",
#   password_confirmation: "12345678"
# )

# Subscription.create!(user: user, course: course_got)
