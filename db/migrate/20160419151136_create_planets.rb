class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name, null: false
      t.string :language, null: false
      t.string :sector, null: false
      t.string :region, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
    add_index :planets, :name, unique: true
  end
end
