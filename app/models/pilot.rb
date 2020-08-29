class Pilot < ActiveRecord::Base
    has_many :flights
    has_many :destinations, through: :flights
    belongs_to :user, optional: true
    validates_presence_of :name, :rank
    validates :name, uniqueness: true
end

