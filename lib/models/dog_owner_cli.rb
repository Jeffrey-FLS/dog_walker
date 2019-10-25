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
      puts "Welcome #{@dog_owner.name}!"
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
    check = PROMPT.select("\nMain Menu", [
        "View My Appointments", "Schedule Appointment", "Reschedule Appointment", "Cancel Appointment", "logout", "exit"
    ])

    case check
    when "View My Appointments"
       @dog_owner.reload

      if !@dog_owner.appointments.empty?
        view_schedule(@dog_owner.appointments, true)
        menu
      else
        empty
      end
    when "Schedule Appointment"
      schedule_appointment
    when "Reschedule Appointment"
      reschedule_appointment
    when "Cancel Appointment"
      cancel_appointment
    when "logout"
      logout
    when "exit"
      exit_cli
    end
  end

  def self.schedule_appointment
    availability_list = AvailableWorkDay.availability_list

    if !availability_list.empty?
      scheduled_list = availability_list.map { |schedule| schedule[0] }
      scheduled_list << RETURN
      check = PROMPT.select("List of Schedules", scheduled_list)

      if check != RETURN
        availability_list.each do |schedule|
          if schedule[0] == check
            available_schedule = AvailableWorkDay.find(schedule[1])

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
            menu
          end
        end
      else
        menu
      end
    else
      empty
    end
  end


  def self.reschedule_appointment
    if !@dog_owner.appointments.empty?
      schedule_id = view_schedule(@dog_owner.appointments, true)
      if !schedule_id.nil?
        check = PROMPT.yes?("Are you sure you want to reschedule?")

        if check
          Appointment.destroy(schedule_id)
          schedule_appointment
        else
          reschedule_appointment
        end
      else
        menu
      end
    else
      empty
    end
  end


  def self.cancel_appointment
    if !@dog_owner.appointments.empty?
      schedule_id = view_schedule(@dog_owner.appointments, true)
      if !schedule_id.nil?
        check = PROMPT.yes?("Are you sure you want to cancel your appointment?")

        if check
          Appointment.destroy(schedule_id)
          menu
        else
          cancel_appointment
        end
      else
        menu
      end
    else
      empty
    end
  end
end