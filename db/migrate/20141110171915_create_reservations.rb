class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :date
      t.integer :restaurant_id

      t.timestamps
    end
    add_index :reservations, :restaurant_id
  end
end
