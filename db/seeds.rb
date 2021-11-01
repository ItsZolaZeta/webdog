# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dummy users 

intro_admin = "Hello, I'm an admin at Webdog. Happy to have you."
intro_trainer = "Hello, I'm a certified dog trainer at Webdog. You can schedule classes with me."
intro_client = "Hello, I'm a client at Webdog. Let's train my dog!"

admin1 = User.create!(email: 'admin1@gmail.com', password: 'pw', name: 'Tatiana Tuor', role: 'admin', introduction: intro_admin)
admin2 = User.create!(email: 'admin2@gmail.com', password: 'pw', name: 'Robin Patriarca', role: 'admin', introduction: intro_admin)
trainer1 = User.create!(email: 'trainer1@gmail.com', password: 'pw', name: 'Gina', role: 'trainer', introduction: intro_trainer)
trainer2 = User.create!(email: 'trainer2@gmail.com', password: 'pw', name: 'Christian Zingg', role: 'trainer', introduction: intro_trainer)
trainer3 = User.create!(email: 'trainer3@gmail.com', password: 'pw', name: 'Lindsay', role: 'trainer', introduction: intro_trainer)
client1 = User.create!(email: 'client1@gmail.com', password: 'pw', name: 'Pamela', role: 'client', introduction: intro_client)
client2 = User.create!(email: 'client2@gmail.com', password: 'pw', name: 'Chaac', role: 'client', introduction: intro_client)
client3 = User.create!(email: 'client3@gmail.com', password: 'pw', name: 'Dima', role: 'client', introduction: intro_client)
client4 = User.create!(email: 'client4@gmail.com', password: 'pw', name: 'Vy', role: 'client', introduction: intro_client)
client5 = User.create!(email: 'client5@gmail.com', password: 'pw', name: 'Lancer', role: 'client', introduction: intro_client)
client6 = User.create!(email: 'client6@gmail.com', password: 'pw', name: 'Saint', role: 'client', introduction: intro_client)
client7 = User.create!(email: 'client7@gmail.com', password: 'pw', name: 'Talon', role: 'client', introduction: intro_client)
client8 = User.create!(email: 'client8@gmail.com', password: 'pw', name: 'Anvil', role: 'client', introduction: intro_client)
client9 = User.create!(email: 'client9@gmail.com', password: 'pw', name: 'Kestrel', role: 'client', introduction: intro_client)

# Dummy dogs
breed_list = ['German Shepherd', 'Swiss White Shepherd', 'Australian Shepherd', 
    'Goldren Retriever', 'Labrador Retriever', 'Husky', 'Chihuahua', 'Poodle', 'Mixed']
dog1 = Dog.create!(name: "Zuka", breed: breed_list[1], birthday: "2020-07-31", gender: 'Male', user: admin1)

dog2 = Dog.create!(name: "Billy", breed: breed_list[2], birthday: "2020-08-10", gender: 'Male', user: client1)

dog3 = Dog.create!(name: "Riley", breed: breed_list[1], birthday: "2020-01-23", gender: 'Female', user: trainer1)

dog4 = Dog.create!(name: "Plume", breed: breed_list[3], birthday: "2018-05-20", gender: 'Female', user: trainer2)

dog5 = Dog.create!(name: "Rookie", breed: breed_list[5], birthday: "2019-08-15", gender: 'Male', user: trainer3)

# Dummy blog posts

# Dummy forum questions - none


