class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :location
      t.string :room_number
      t.string :calendar_id

      t.timestamps
    end
  end
end
