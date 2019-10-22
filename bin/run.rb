require_relative '../config/environment'
# require '../lib'
# require_all 'lib'
require 'pry'

puts "hello world"

# binding.pry
def welcome
  puts "Welcome to Dog Walker"
end

def user_login_create_input
  puts "Login or Create Account"
  puts "Do you want to create an account?"
  create_account = gets.chomp

  if create_account == "yes"
    puts "input username"
    username = gets

    dog_owner = DogOwner.create(username: username, password: "test", name: "test",phone_number: 0, address: "set")

    puts dog_owner
  end

  # if login_account == "yes"
  #   username = gets
  #   password = gets
  #   dog_owner = DogOwner.password_authenticate(username, password)
  # end

end

welcome
user_login_create_input

