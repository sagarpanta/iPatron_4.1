class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :code
      t.string :description
      t.datetime :startdate
      t.datetime :enddate
      t.string :playerid
      t.integer :read
      t.integer :total_bulbs

      t.timestamps
    end
  end
end
