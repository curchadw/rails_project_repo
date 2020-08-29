class SessionsController < ApplicationController
    

    def new
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

    protected

  def auth_hash
    request.env['omniauth.auth']
  end
    
end