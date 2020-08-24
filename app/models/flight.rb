class Flight < ActiveRecord::Base
    has_many :passengers
    belongs_to :destination, class_name: "Flight" ,optional: true
    belongs_to :pilot, class_name: "Flight" ,optional: true
    accepts_nested_attributes_for :passengers
    belongs_to :user, class_name: "Flight" ,optional: true 


    def dest_name=(name)
        self.destination = Destination.find_or_create_by(name: name)
    end

    def dest_name
        self.destination ? self.destination.name : nil
    end

    def pilot_name=(name)
        self.pilot = Pilot.find_or_create_by(name: name)
    end

    def pilot_name
        self.pilot ? self.pilot.name : nil
    end

    def self.search(search)
        if search
            flight_num = Flight.find_by(flight_number: search)
                if flight_num
                    self.where(flight_id: flight_num)
                else
                    @flights = Flight.all
                end
        else
            @flights = Flight.all
        end
    end

end