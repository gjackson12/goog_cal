class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      
      t.string      :summary,     null: false
      t.string      :description, null: false
      t.datetime    :start_at,    null: false
      t.datetime    :end_at,      null: false

      t.timestamps
      
    end
  end
end
