class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
