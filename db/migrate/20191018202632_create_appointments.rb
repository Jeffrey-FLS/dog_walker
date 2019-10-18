class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :day
      t.string :time
      t.integer :price
      t.string :completion_status 
      t.integer :dog_owner_id
      t.integer :dog_walker_id
      t.timestamps
    end
  end
end
