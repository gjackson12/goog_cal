class AddUserToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :uid, :string
  end
end
