class User < ActiveRecord::Base
 
  
    has_many :flights
    has_many :pilots
    has_many :passengers
    has_many :destinations
    has_secure_password
    validates_presence_of :username, :password
    validates :username, uniqueness: true
    validates_length_of :username,  in: 6..10
    validates_length_of :password, in: 6..20 
    validates :username, uniqueness: true
    
    def self.create_with_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.name = auth["info"][name]
        end
    end
    
    

    

    
end