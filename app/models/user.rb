class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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

    devise :database_authenticatable, :registerable, :omniauthable, :recoverable, :rememberable, :trackable, :validatable
   
    

    

    
end