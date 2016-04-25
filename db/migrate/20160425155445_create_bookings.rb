class CreateBookings < ActiveRecord::Migration
  def change
    create_join_table :vacations, :events, table_name: :bookings do |t|
      t.index :vacation_id
      t.index :event_id
    end
  end
end
