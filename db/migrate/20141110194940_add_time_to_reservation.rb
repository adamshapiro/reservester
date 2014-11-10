class AddTimeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :time, :string
  end
end
