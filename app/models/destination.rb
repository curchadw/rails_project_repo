class Destination < ActiveRecord::Base
    has_many :flights
    has_many :pilots, through: :flights
    belongs_to :user 
end