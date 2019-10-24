
module TimeCalc

  def self.schedule_list(schedules)
    list = []

    schedules.each do |able|
      time_split_arr = able.starting_time.split(":")
      time_calc = time_split_arr[0].to_i + able.working_hours

      time_ans = 0
      inverted_am_pm = ""

      if time_calc > 12
        time_ans = time_calc - 12

        invert_pm_am = time_split_arr[1].split(" ")[1]

        if invert_pm_am == "AM"
          invert_pm_am = "PM"
        else
          invert_pm_am = "AM"
        end

        inverted_am_pm = "00 #{invert_pm_am}"

      else
        inverted_am_pm = time_split_arr[1]
        time_ans = time_calc
      end

      end_shift = "#{time_ans}:#{inverted_am_pm}"

      list.push(
          ["#{able.month} #{able.day} at #{able.starting_time} till #{end_shift} | #{DogWalker.find(able.dog_walker_id).name}", able.id, able.dog_walker_id]
      )
    end

    return list
  end
end