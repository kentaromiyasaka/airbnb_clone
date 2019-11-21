class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out
      t.float :price
      t.float :total_price

      t.timestamps
    end
  end
end