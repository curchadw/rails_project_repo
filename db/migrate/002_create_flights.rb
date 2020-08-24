class CreateFlights < ActiveRecord::Migration[5.1]
    def change
        create_table :flights do |t|
            t.integer :pilot_id
            t.integer :destination_id
            t.string :flight_number
            t.timestamps :null => false
            
            
        
        end
    end
end