class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email

    end
  end
end
