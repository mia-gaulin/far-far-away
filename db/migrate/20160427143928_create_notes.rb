class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body, null: false
      t.belongs_to :vacation, null: false

      t.timestamps null: false
    end
  end
end
