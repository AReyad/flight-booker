class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.belongs_to :arrival_airport
      t.belongs_to :departure_airport
      t.datetime :date
      t.string :duration
      t.timestamps
    end
  end
end
