require 'securerandom'

class GithubController < ApplicationController
    skip_before_action :verified_user
  
    
    
    def create
       
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['nickname']
            u.password = SecureRandom.hex(10)
            
            
            
          end
          
          session[:user_id] = @user.id
       
          redirect_to @user, notice: 'Logged in!'
        
    end
     
    #   private
   private
     
      def auth
        request.env['omniauth.auth']
      end
      
  end