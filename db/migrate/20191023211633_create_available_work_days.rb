class CreateAvailableWorkDays < ActiveRecord::Migration[6.0]
  def change
    create_table :available_work_days do |t|
      t.string :month
      t.string :day
      t.string :starting_time
      t.integer :working_hours
      t.integer :dog_walker_id
      t.timestamps
    end
  end
end
