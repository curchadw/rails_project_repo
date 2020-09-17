class CreatePilots < ActiveRecord::Migration[5.1]
    def change
        create_table :pilots do |t|
            t.string :name
            t.string :rank
            
            t.integer :user_id
            t.integer :flight_id
            t.timestamps :null => false
        
        end
    end
end