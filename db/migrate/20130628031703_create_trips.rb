class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :booking_time
      t.datetime :pickup_time
      t.string :status
      t.boolean :app
      t.boolean :test
      t.boolean :gmaps

      t.timestamps
    end
  end
end
