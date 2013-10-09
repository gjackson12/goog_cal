class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      
      t.string      :summary,     null: false
      t.string      :calendar_id, null: false
      t.string      :description, null: false
      t.datetime    :start_at,    null: false
      t.datetime    :end_at,      null: false

      t.timestamps
      
    end
  end
end
