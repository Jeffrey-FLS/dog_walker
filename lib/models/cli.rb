
# require "tty-prompt"

class Cli
  attr_accessor :dog_owner

  PROMPT = TTY::Prompt.new

  def init
    welcome
    login_or_create
    # schedule
    # appointments

  end

  def welcome
    puts "Welcome to Wag part 2"
  end

  def login_or_create
    # @dog_owner = nil
    check = PROMPT.select("Login or Create Account",["login", "create_account"])

    if check == "login"
      login
    else
      create_account
    end


    if @dog_owner.nil?
      puts "Sorry, Username or Password is wrong. Please try again"
      login
    end

    # schedule

  end

  # def user_login
  #   user_pass = []
  #
  #   puts "Username?"
  #   user_pass < gets.chomp
  #   puts "Password?"
  #   user_pass < gets.chomp
  #
  #   return user_pass
  # end

  def login
    # user_pass = []
    # user_pass = user_login

    puts "Username?"
    username = gets.chomp
    puts "Password?"
    password = gets.chomp

    @dog_owner = DogOwner.username_password_auth(username, password)

    # while @dog_owner.nil?
    #   puts "Sorry, Username or Password is wrong. Please try again"
    #   user_pass = user_login
    #   @dog_owner = DogOwner.username_password_auth(user_pass[0], user_pass[1])
    # end

    if !@dog_owner.nil?
      puts "DOG OWNER IS #{@dog_owner.name}"
    end
  end

  def create_account
    PROMPT.mask("Username? ")

  end

  def schedule
    appointments
  end

  def appointments
  end

end