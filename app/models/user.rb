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
    validates :username, uniqueness: true
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,:omniauthable

    def self.from_omniauth(auth)  
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
        end
      end

    

    

    
end