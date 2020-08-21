class Flight < ActiveRecord::Base
    has_many :passengers
    accepts_nested_attributes_for :passengers
    belongs_to :user 
end