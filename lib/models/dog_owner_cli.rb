
class DogOwnerCLI < CLI
  attr_accessor :dog_owner

  def self.init
    login_or_create
    menu
  end

  def self.login
    arr_user_owner = super
    @dog_owner = DogOwner.username_password_auth(arr_user_owner[0], arr_user_owner[1])




    unless @dog_owner.nil?
        puts "DOG OWNER IS #{@dog_owner.name}"
    end

    # menu
  end

  def self.create_account
    dog_owner_arr = super

    @dog_owner = DogOwner.create(
        username: dog_owner_arr[0],
        password: dog_owner_arr[1],
        name: dog_owner_arr[2],
        phone_number: dog_owner_arr[3].to_i,
        address: dog_owner_arr[4]
    )
  end

  def self.menu
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

  def schedule_appointment
    puts "schedule"
  end

  def reschedule_appointment
    puts "======"
  end

  def cancel_appoinment
    puts ",,,,,,,,,,,"
  end
end