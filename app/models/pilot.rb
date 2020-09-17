class Pilot < ActiveRecord::Base
    belongs_to :user, optional: true
    has_many :flights
    has_many :destinations, through: :flights
    
    validates_presence_of :name, :rank
    validates :name, uniqueness: true
    scope :top_pilot, -> { order(flight_count: :desc).limit(1)}
   
end

