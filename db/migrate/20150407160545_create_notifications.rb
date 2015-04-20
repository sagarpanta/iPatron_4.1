class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
	  t.integer :notificationid
      t.string :code
      t.string :description
      t.string :notification
      t.integer :read
	  t.string :playerid
	  t.integer :bulb
	  t.datetime :startdate
	  t.datetime :enddate
	  t.datetime :drawingtime
	  t.integer :num_of_entries

      t.timestamps
    end
  end
end

