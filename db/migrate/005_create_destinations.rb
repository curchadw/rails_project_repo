class CreateDestinations < ActiveRecord::Migration[5.1]
    def change
        create_table :destinations do |t|
            t.string :name
            t.integer :user_id
            t.integer :flight_id
            t.timestamps :null => false
           
        
        end
    end
end