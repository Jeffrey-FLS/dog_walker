class AddAvailableDaysToDogWalkers < ActiveRecord::Migration[6.0]
  def change
    add_column :dog_walkers, :available_days, :text
  end
end
