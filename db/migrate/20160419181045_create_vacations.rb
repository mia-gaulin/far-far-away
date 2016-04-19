class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :num_of_people, null: false
      t.string :vacationer, null: false
      t.belongs_to :planet, null: false

      t.timestamps null: false
    end
  end
end
