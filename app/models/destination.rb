class Destination < ActiveRecord::Base
    has_many :flights
    has_many :pilots, through: :flights
    belongs_to :user , optional: true

    scope :order_by_name, -> { order(name: :asc) }
    

    
    
end