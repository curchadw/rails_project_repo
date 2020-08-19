class Flight < ActiveRecord::Base
    belongs_to :flight
    has_many :passengers
    belongs_to :user 
end