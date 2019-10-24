
class DogOwnerCLI < CLI
  attr_accessor :dog_owner
  # include TimeCalc

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
      view_schedule(@dog_owner.appointments, true)
      menu
    when "Schedule Appointment"
      schedule_appointment
    when "Reschedule Appointment"
      reschedule_appointment
    when "Cancel Appoinment"
      cancel_appoinment
    when "exit"
      exit_cli
    end
  end

  def self.schedule_appointment
    availability_list = AvailableWorkDay.availability_list
    scheduled_list = availability_list.map {|schedule| schedule[0]}
    check = PROMPT.select("List of Schedules", scheduled_list)

    availability_list.each do |schedule|
      if schedule[0] == check
        available_schedule = AvailableWorkDay.find(schedule[1])
        # DogWalker.find_dog_walker_id

        # binding.pry
        Appointment.create(
               month: available_schedule.month,
               day: available_schedule.day,
               starting_time: available_schedule.starting_time,
               working_hours: available_schedule.working_hours,
               price: 50,
               completion_status: '',
               dog_owner_id: @dog_owner.id,
               dog_walker_id: schedule[2]
        )

        AvailableWorkDay.destroy(available_schedule.id)
      end
    end

    menu
  end

  def self.reschedule_appointment
    schedule_id = view_schedule(@dog_owner.appointments, true)
    check = PROMPT.select("Are you sure you want to reschedule?",["Yes", "No"])

    if check == "Yes"
      Appointment.destroy(schedule_id)
      schedule_appointment
    else
      menu
    end
  end


  def cancel_appoinment
    puts ",,,,,,,,,,,"
  end
end