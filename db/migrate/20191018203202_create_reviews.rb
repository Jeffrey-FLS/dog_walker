class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.integer :dog_owner_id
      t.integer :dog_walker_id
      t.timestamps
    end
  end
end
