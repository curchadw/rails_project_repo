class User < ActiveRecord::Base
    has_many :flights
    has_many :pilots
    has_many :passengers
    has_many :destinations
    has_secure_password

#     validates :username,  
#             presence: true  
#     validates :password,  
#             presence: true  
    
end