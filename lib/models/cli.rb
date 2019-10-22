
# require "tty-prompt"

class Cli
  attr_accessor :dog_owner

  PROMPT = TTY::Prompt.new

  def init
    welcome
    login_or_create
  end

  def welcome
    puts "Welcome to Wag part 2"
  end

  def login_or_create

    check = PROMPT.select("Login or Create Account",["login", "create_account"])

    if check == "login"
      login
    else
      create_account
    end
puts "==================="

    if @dog_owner.nil?
      puts "Sorry, Username or Password is wrong. Please try again"
      login
    end

  end

  def login
    puts "Username?"
    username = gets.chomp
    password = PROMPT.mask("Enter Password:")
    #password = gets.chomp

    @dog_owner = DogOwner.username_password_auth(username, password)

    if !@dog_owner.nil?
      puts "DOG OWNER IS #{@dog_owner.name}"
    end
  end

  def create_account
    puts "Enter your username"
    username_input = gets.chomp 
    password_inpt = PROMPT.mask("Enter your password") 
    puts "Enter your Name"
    name_inpt  = gets.chomp 
    puts "Enter your Phone Number"
    phone_inpt = gets.chomp.to_i
    puts "Enter your Address"
    address_inpt = gets.chomp

  end

  

end