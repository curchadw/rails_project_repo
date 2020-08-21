class SessionsController < ApplicationController
    def new
    end
    
    
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
        #    log_in user
           sessions[:user_id] = user.id
           redirect_back_or user, notice: 'Logged in!'
        else
           flash.now[:danger] = 'Invalid email/password combination'
           render :new
        end
    end


    def destroy
        session.delete(:user_id)
        redirect_to '/', notice: 'Logged out!'
    end
    
end