class SessionsController < ApplicationController
  skip_before_action :verified_user

    def new
    end
    
    def github_create
        auth = request.env["omniauth.auth"]     
        @user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
        session[:user_id] = user.id     
        redirect_to root_url, :notice => "Signed in!"
    end
    
    def create
        
        @user = User.find_by(username: params[:username]) 
        if @user && @user.authenticate(params[:password])
        #    log_in user
           session[:user_id] = @user.id
           
           redirect_to @user, notice: 'Logged in!'
        else
           flash.now[:danger] = 'Invalid email/password combination'
           render :new
        end
    end


    def destroy
        session[:user_id] = nil
        redirect_to '/', notice: 'Logged out!'
    end

   
 
    
end