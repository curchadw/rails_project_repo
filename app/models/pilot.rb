class Pilot < ActiveRecord::Base
    belongs_to :user, optional: true
    has_many :flights
    has_many :destinations, through: :flights
    
    validates_presence_of :name, :rank
    validates :name, uniqueness: true

    # def self.search(search)
    #     if search
    #         pilot = Pilot.find_by(name: search)
    #         if  pilot
    #             self.where(name: pilot)
    #         else
    #             Pilot.all
    #         end
    #     else
    #         Pilot.all
    #     end
    # end
end

