
class ChangeColumnNameOfTimeInAppointments < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :time, :starting_time
  end
end
