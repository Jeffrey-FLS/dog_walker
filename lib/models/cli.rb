
class CLI
  PROMPT = TTY::Prompt.new

  def init
      welcome
      user_owner_walker
  end

  def welcome
    puts "\n\n Welcome to Wag part 2 \n\n"
    # system "figlet Welcome to Wag part 2"
  end

  def user_owner_walker
    check = PROMPT.select("Are you the Dog Owner or Dog Walker?",[
        "Owner", "Walker", "exit"
    ])

    case check
    when "Owner"
      DogOwnerCLI.init
    when "Walker"
      DogWalkerCLI.init
    when "exit"
      exit_cli
    end
  end

  def self.login_or_create
    check = PROMPT.select("Login or Create Account",[
        "login", "create account", "exit"
    ])

    case check
    when "login"
      login
    when "create account"
      create_account
    when "exit"
      exit_cli
    end

    if @dog_owner.nil? && @dog_walker.nil?
      puts "Sorry, Username or Password is wrong. Please try again \n"
      login
    end
  end

  def self.login
    username = PROMPT.ask("Enter Username:")
    password = PROMPT.mask("Enter Password:")

    return [username,password]
  end


  def self.create_account
    username = PROMPT.ask("Enter Username:")
    password = PROMPT.mask("Enter your password")
    name = PROMPT.ask("Enter your name")
    phone_number = PROMPT.ask("Enter your phone number")
    address = PROMPT.ask("Enter your address")

    return [
        username,
        password,
        name,
        phone_number,
        address
    ]
  end

  def self.exit_cli
    puts "Thanks for the visit, Goodbye"
    exit
  end
end