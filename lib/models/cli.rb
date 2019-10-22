
class Cli
  attr_accessor :dog_owner

  PROMPT = TTY::Prompt.new

  def init
      welcome
      login_or_create
      menu
  end

  def welcome
    puts "Welcome to Wag part 2 \n\n"
  end

  def login_or_create
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

    if @dog_owner.nil?
      puts "Sorry, Username or Password is wrong. Please try again \n"
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

  def menu
    check = PROMPT.select("Login or Create Account",[
        "View Schedule", "Schedule Appointment", "Reschedule Appointment", "Cancel Appoinment", "exit"
    ])

    case check
    when "View Schedule"
      view_schedule
    when "Schedule Appoinment"
      schedule_appointment
    when "Reschedule Appointment"
      reschedule_appointment
    when "Cancel Appoinment"
      cancel_appoinment
    when "exit"
      exit_cli
    end

    # check == "login" ? login : create_account
  end

  def view_schedule

  end

  def schedule_appointment
    puts "schedule"
  end

  def reschedule_appointment
    puts "======"
  end

  def cancel_appoinment
    puts ",,,,,,,,,,,"
  end

  def exit_cli
    puts "Thanks for the visit, Goodbye"
    exit
  end

end