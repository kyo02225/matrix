# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |s|
  Todo.create(user_id: 1, title: "sample.upper-left#{s}", urgency: "low", importance: "high", deadline: "2020/1/20", status: "アクティブ")
end
5.times do |s|
  Todo.create(user_id: 1, title: "sample.upper-right#{s}", urgency: "high", importance: "high", deadline: "2020/1/20", status: "アクティブ")
end
5.times do |s|
  Todo.create(user_id: 1, title: "sample.lower-right#{s}", urgency: "high", importance: "low", deadline: "2020/1/20", status: "アクティブ")
end
5.times do |s|
  Todo.create(user_id: 1, title: "sample.lower-left#{s}", urgency: "low", importance: "low", deadline: "2020/1/20", status: "アクティブ")
end
