DogOwner.create(username: "Test1", password: "123456", name: "Soufi", phone_number: "6462312553", address: "brooklyn")
DogOwner.create(username: "Test2", password: "215365", name: "adam", phone_number: "6462312553", address: "bayrudge")
DogOwner.create(username: "Test3", password: "864215", name: "Jeff", phone_number: "6462312553", address: "no adress")
DogOwner.create(username: "Test4", password: "321456", name: "lili", phone_number: "6462312553", address: "empthy")
DogOwner.create(username: "Test5", password: "102350", name: "unknow", phone_number: "6462312553", address: "jklj")
DogOwner.create(username: "Test6", password: "132365", name: "someone", phone_number: "6462312553", address: "brooklyn")


DogWalker.create(name: "Makayla", username: "someone", password: 123456, phone_number: 2025550134,available: "thuesday", price: 25)
DogWalker.create(name: "Alaina", username: "tammy", password: 123456, phone_number: 2025550166,available: "thursday", price: 30)
DogWalker.create(name: "Hester", username: "davina", password: 123456, phone_number: 2353201254,available: "monday", price: 24)
DogWalker.create(name: "Natalia", username: "thomasina", password: 123456, phone_number: 2025552154,available: "sunday", price: 20)
DogWalker.create(name: "Kallum", username: "bronislava", password: 123456, phone_number: 2025512544,available: "friday", price: 35)
DogWalker.create(name: "Louisa", username: "brandan", password: 123456, phone_number: 2025545234,available: "sunday", price: 25)
DogWalker.create(name: "Neve", username: "louise", password: 123456, phone_number: 2025548854,available: "friday", price: 20)
person_margo = DogWalker.create(name: "Margo", username: "fedora", password: 123456, phone_number: 1263855546, available: "wednesday", price: 24)


Appointment.create(day: "monday", time: "12:00pm", price: 25,person_margo.id, person_margo.id)
Appointment.create(day: "tuesday", time: "7:30am", price: 25,)
Appointment.create(day: "friday", time: "8:00am", price: 25,)
Appointment.create(day: "thursday", time: "2:00pm", price: 25,)
Appointment.create(day: "sunday", time: "5:00pm", price: 25,)
