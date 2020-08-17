class CreatePilots < ActiveRecord::Migration[5.1]
    def change
        create_table :pilots do |t|
            t.string :name
            t.string :rank
        
        end
    end
end