class AddGoogleEventIdToReservationsTable < ActiveRecord::Migration
  def change
    add_column :reservations, :google_event_id, :string
  end
end
