class CreatePassengers < ActiveRecord::Migration[5.1]
    def change
        create_table :passengers do |t|
            t.string :name
            t.integer :flight_id
           
        
        end
    end
end