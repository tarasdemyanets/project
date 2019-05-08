class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :item, foreign_key: { to_table: :items }
      t.belongs_to :user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
