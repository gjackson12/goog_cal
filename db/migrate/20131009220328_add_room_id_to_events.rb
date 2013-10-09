class AddRoomIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :room_id, :string
  end
end
