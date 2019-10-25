class CLI
  PROMPT = TTY::Prompt.new
  RETURN = "return to main menu"

  def init
    welcome
    self.class.user_owner_walker
  end

  def welcome
    system("clear")
    puts "\n\n"
    system("dogsay WELCOME TO WAG PART 2!")
    # puts "\n\n Welcome to Wag part 2 \n\n\n"
    # system "figlet Welcome to Wag part 2"
  end

  def self.user_owner_walker
    check = PROMPT.select("Are you the Dog Owner or Dog Walker?", [
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
    check = PROMPT.select("\nLogin or Create Account", [
        "login", "create account", "user select", "exit"
    ])

    case check
    when "login"
      login
    when "create account"
      create_account
    when "user select"
      user_owner_walker
    when "exit"
      exit_cli
    end

    if @dog_owner.nil? && @dog_walker.nil?
      puts "Sorry, Username or Password is wrong. Please try again \n"
      login_or_create
    end
  end

  def self.login
    username = PROMPT.ask("Enter Username:")
    password = PROMPT.mask("Enter Password:")

    return [username, password]
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

  def self.view_schedule(appointment_list, is_appointment)
    include TimeCalc
    # Make a condition that will return "no appointments made" under a new user without a set appointment

    availability_list = TimeCalc.schedule_list(appointment_list)
    scheduled_list = availability_list.map { |schedule| schedule[0] }
    scheduled_list << RETURN
    check = PROMPT.select("List of schedules", scheduled_list)

    if check != RETURN
      availability_list.each do |schedule|
        if schedule[0] == check
          if is_appointment
            scheduled_list = nil
            return Appointment.find(schedule[1]).id
          else
            scheduled_list = nil
            return AvailableWorkDay.find(schedule[1]).id
          end
        end
      end
    end
  end

  def self.logout
    puts "\nYou've successfully logged out\n"
    @dog_owner = nil
    @dog_walker = nil
    user_owner_walker
  end

  def self.exit_cli
    puts "Thanks for the visit, Goodbye"
    exit
  end

  def self.empty
    check = PROMPT.select("\nThe list is empty :/", [RETURN])
    check == RETURN ? menu : ''
  end
end