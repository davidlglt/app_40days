# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

AdminUser.destroy_all
AdminUser.create!(email: 'admin3@example.com', password: 'password', password_confirmation: 'password')


# Cleanup Begin
Lesson.destroy_all
Subscription.destroy_all
Course.destroy_all
User.destroy_all
# Cleanup end



course = Course.create!(name: 'Comprendre la première league', duration: 40, total_words: 950, price: 59, video_teaser: "7j4zix8pxq", image: File.open(Rails.root.join('db/seeds/images/football.jpg') ) )

Lesson.create!(name: "Introduction", tag: 1, video: "1", header: true, course: course, position: 1)
Lesson.create!(name: "Début d'un Match", tag: 1, video: "7j4zix8pxq", course: course, position: 2)
Lesson.create!(name: "Les joueurs et l'arbitrage", video: "iovihdufe0", tag: 1, course: course, position: 3)
Lesson.create!(name: "Actions en défense", tag: 1, video: "7j4zix8pxq", course: course, position: 4)
Lesson.create!(name: "L'attaque", video: "1", header: true, tag: 2, course: course, position: 5)
Lesson.create!(name: "Types d'attaque", video: "iovihdufe0", tag: 2, course: course, position: 6)
Lesson.create!(name: "Zone de but", tag: 2, video: "7j4zix8pxq", course: course, position: 7)
Lesson.create!(name: "But et score", video: "1", header: true, tag: 3, course: course, position: 8)
Lesson.create!(name: "Penalty", video: "iovihdufe0", tag: 3, course: course, position: 9)
Lesson.create!(name: "Arrêts et parades", tag: 3, video: "7j4zix8pxq", course: course, position: 10)

Course.create!(name: 'Comprendre GOT en Anglais', duration: 40, total_words: 950, price: 59, video_teaser: "7j4zix8pxq", image: File.open(Rails.root.join('db/seeds/images/GOT.png') ) )

Course.create!(name: 'Lire et comprendre "The old man and the sea"', duration: 40, total_words: 800, price: 49, video_teaser: "7j4zix8pxq", image: File.open(Rails.root.join('db/seeds/images/old_man.jpg') ) )

Course.create!(name: 'Savoir Lire et Écrire en arabe', duration: 20, total_words: 500, price: 69, video_teaser: "7j4zix8pxq", image: File.open(Rails.root.join('db/seeds/images/arabic.jpg') ) )

# course_got = Course.create!(
#   name: "GOT",
#   image: File.open(Rails.root.join('db/seeds/images/GOT.jpeg'))




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
