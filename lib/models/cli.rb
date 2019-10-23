
class CLI
  attr_accessor :dog_owner

  PROMPT = TTY::Prompt.new

  def init
      welcome
      user_owner_walker
      # login_or_create
      # menu
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

    # return arr_user_pass
    # return login
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

  # def menu
  #   check = PROMPT.select("Login or Create Account",[
  #       "View Schedule", "Schedule Appointment", "Reschedule Appointment", "Cancel Appoinment", "exit"
  #   ])
  #
  #   case check
  #   when "View Schedule"
  #     view_schedule
  #   when "Schedule Appoinment"
  #     schedule_appointment
  #   when "Reschedule Appointment"
  #     reschedule_appointment
  #   when "Cancel Appoinment"
  #     cancel_appoinment
  #   when "exit"
  #     exit_cli
  #   end
  #
  #   # check == "login" ? login : create_account
  # end
  #
  def self.view_schedule
    puts "view method"
  end
  #
  # def schedule_appointment
  #   puts "schedule"
  # end
  #
  # def reschedule_appointment
  #   puts "======"
  # end
  #
  # def cancel_appoinment
  #   puts ",,,,,,,,,,,"
  # end

  def self.exit_cli
    puts "Thanks for the visit, Goodbye"
    exit
  end

end