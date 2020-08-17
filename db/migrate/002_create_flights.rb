class CreateFlights < ActiveRecord::Migration[5.1]
    def change
        create_table :flights do |t|
            t.integer :pilot_id
            t.integer :passenger_id
            t.string :flight_number
            
        
        end
    end
end