class AddAddressToDogWalkers < ActiveRecord::Migration[6.0]
  def change
    add_column :dog_walkers, :address, :string
  end
end
