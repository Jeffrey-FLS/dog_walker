class CreateDogOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_owners do |t|
      t.string :username
      t.string :password
      t.string :name
      t.integer :phone_number
      t.string :address
    end
  end
end
