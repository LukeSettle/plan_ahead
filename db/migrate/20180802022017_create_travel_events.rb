class CreateTravelEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_events do |t|
      t.references :parent_event, index: true
      t.string :origin
      t.string :destination
      t.datetime :departure_time
      t.datetime :arrival_time
      t.string :mode_of_transportation
      t.jsonb :data

      t.timestamps
    end
  end
end
