class AddUserToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :uid, :string, null: false
  end
end
