class Flight < ActiveRecord::Base
    has_many :passengers
    belongs_to :destination
    belongs_to :pilot, counter_cache: :flight_count
    accepts_nested_attributes_for :passengers
    belongs_to :user, class_name: "Flight" ,optional: true 
    validates_presence_of :flight_number
    validates :flight_number, uniqueness: true
    scope :order_by_flight_international, -> { order(flight_number: :asc).where("LENGTH(flight_number) > 3") }
    scope :order_by_flight_domestic, -> { order(flight_number: :asc).where("LENGTH(flight_number) <= 2 ") }
    

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

    

end