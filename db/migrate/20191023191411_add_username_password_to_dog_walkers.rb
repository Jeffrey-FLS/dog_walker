class AddUsernamePasswordToDogWalkers < ActiveRecord::Migration[6.0]
  def change
    add_column :dog_walkers, :username, :string
    add_column :dog_walkers, :password, :string
  end
end
