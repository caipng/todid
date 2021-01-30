# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_by_email("techlead@google.com") || User.create!(email: 'techlead@google.com', name: "Cai Kaian", password: 'password')
user.todos.find_by_title("get good") || user.todos.create!(title: 'get good', description: 'xd', completed: false)
user.todos.find_by_title('complete cvwo project!') || user.todos.create!(title: 'complete cvwo project!', description: 'soon hopefully..', completed: false, due_time: Time.now, tags: 'coding,forfun')
user.todos.find_by_title('find the meaning of life!') || user.todos.create!(title: 'find the meaning of life!', description: 'soon hopefully..', completed: false, due_time: 2.days.ago, tags: 'meh') 
user.todos.find_by_title('get vaccinated') || user.todos.create!(title: 'get vaccinated', description: 'soon hopefully..', completed: false, due_time: 10.days.from_now, tags: 'forfun')