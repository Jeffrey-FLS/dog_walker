class AddHoursToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :working_hours, :integer
  end
end
