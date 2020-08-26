class User < ActiveRecord::Base
    has_many :flights
    has_many :pilots
    has_many :passengers
    has_many :destinations
    has_secure_password
    validates :username, :password, presence: true
    validates :username, uniqueness: true
    validates :username, length: { in: 6..10 }
    validates :password, length: { in: 6..20 }


    
end