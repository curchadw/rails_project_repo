class Pilot < ActiveRecord::Base
    belongs_to :user, optional: true
    has_many :flights
    has_many :destinations, through: :flights
    
    validates_presence_of :name, :rank
    validates :name, uniqueness: true

    def self.search(search)
        if search
            user = User.find_by(name: search)
            if  user
                self.where(user_id: user)
            else
                Pilot.all
            end
        else
            Pilot.all
        end
    end
end

