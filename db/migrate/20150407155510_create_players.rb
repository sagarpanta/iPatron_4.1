class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :address
      t.string :clublevel
      t.string :contact
      t.string :encrypted_password
      t.string :encrypted_password_confirmation
      t.string :name
      t.string :playerid
	  t.string :salt
      t.integer :ptsBal
      t.integer :ptsRed

      t.timestamps
    end
  end
end
