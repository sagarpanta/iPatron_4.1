class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :code
      t.string :description
      t.datetime :drawingtime
      t.datetime :enddate
      t.integer :num_of_entries
      t.string :playerid
      t.integer :read
      t.datetime :startdate

      t.timestamps
    end
  end
end
