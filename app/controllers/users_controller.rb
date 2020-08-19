class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
   
    def create
        @user = User.create(user_params)       
                                                                                                                    
        session[:user_id] = @user.id
        redirect_to '/welcome'
    end

 
    

private

def user_params
    params.require(:user).permit(:name,:password,:admin)
end



end