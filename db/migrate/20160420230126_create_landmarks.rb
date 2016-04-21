class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name, null: false
      t.string :location
      t.belongs_to :planet

      t.timestamps null: false
    end
  end
end
