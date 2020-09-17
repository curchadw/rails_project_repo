class AddFlightCountToPilots < ActiveRecord::Migration[5.1]
    def up
        add_column :pilots, :flight_count, :integer, default: 0
        Pilot.reset_column_information
        Pilot.all.each do |f|
            Pilot.update_counters f.id, flight_count: f.flights.length
        end
    end

    def down
        remove_column :pilots, :flight_count
    end
end