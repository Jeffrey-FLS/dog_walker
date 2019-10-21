class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password
      t.integer :dog_owner_id
      t.timestamps
    end
  end
end
