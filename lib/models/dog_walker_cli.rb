
class DogWalkerCLI < CLI
  attr_accessor :dog_walker

  def self.init
    login_or_create
    menu
  end

  def self.login
    arr_user_owner = super
    @dog_walker = DogWalker.username_password_auth(arr_user_owner[0], arr_user_owner[1])

    unless @dog_walker.nil?
      puts "DOG WALKER IS #{@dog_walker.name}"
    end
  end

  def self.create_account
    dog_walker_arr = super

    @dog_walker = DogWalker.create(
        username: dog_walker_arr[0],
        password: dog_walker_arr[1],
        name: dog_walker_arr[2],
        phone_number: dog_walker_arr[3].to_i,
        address: dog_walker_arr[4]
    )
  end

  def self.menu
    check = PROMPT.select("Login or Create Account",[
        "View Schedule", "Set Available Days", "Change Availability", "Cancel Availability", "exit"
    ])

    case check
    when "View Schedule"
      view_schedule
    when "Set Available Days"
      set_available_days
    when "Change Availability"
      change_availability
    when "Cancel Availability"
      cancel_availability
    when "exit"
      exit_cli
    end
  end

  def self.set_available_days
    months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]

    weeks = ["1st Week" , "2nd Week", "3rd Week", "4th Week"]
    days = ["Sunday", "Monday", "Tuesday", "Wednsday", "Thursday", "Friday", "Saturday"]

    hours = [
        "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM",
        "6:00 PM", "7:00 PM", "8:00 PM"
    ]

    work_hours = Array.new(6)
    work_hours.fill { |i| "#{i + 1} Hours"}

    month = PROMPT.select("Which month are you available to work?", months)
    week = PROMPT.select("Which week of the month?", weeks)
    day = PROMPT.select("Which day of the week?", days)
    time = PROMPT.select("Which time of the day?", hours)
    shift_hours = PROMPT.select("How many hours do you want to work on this shift?", work_hours)

    weekday = week_day_calc(weeks, days, week, day)

    AvailableWorkDay.create(
        month: month,
        day: weekday,
        starting_time: time,
        working_hours: shift_hours,
        dog_walker_id: @dog_walker.id
    )
  end

  def self.week_day_calc(weeks, days, week, day)
    return ((days.find_index(day) + 1) * (weeks.find_index(week) + 1))
  end

  def change_availability
    puts "======"
  end

  def cancel_availability
    puts ",,,,,,,,,,,"
  end
end