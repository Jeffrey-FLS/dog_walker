
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
    check = PROMPT.select("Login or Create Account",["login", "create account"])
    check == "login" ? login : create_account

    if @dog_owner.nil?
      puts "Sorry, Username or Password is wrong. Please try again"
      login
    end
  end

  def login
    username = PROMPT.ask("Enter Username:")
    password = PROMPT.mask("Enter Password:")

    @dog_owner = DogOwner.username_password_auth(username, password)

    unless @dog_owner.nil?
      puts "DOG OWNER IS #{@dog_owner.name}"
    end
  end


  def create_account
    username = PROMPT.ask("Enter Username:")
    password = PROMPT.mask("Enter your password")
    name = PROMPT.ask("Enter your name")
    phone_number = PROMPT.ask("Enter your phone number")
    address = PROMPT.ask("Enter your address")

    @dog_owner = DogOwner.create(
        username: username,
        password: password,
        name: name,
        phone_number: phone_number.to_i,
        address: address
    )

    login_or_create
  end
end