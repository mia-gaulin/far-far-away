class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :location
      t.text :description
      t.belongs_to :planet
    end
  end
end
