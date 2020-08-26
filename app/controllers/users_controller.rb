class UsersController < ApplicationController
 validate :username, :password, presence: true
 validate :username, uniqueness: true
 validate :username, length: { in: 6..10 }
 validate :password, length: { in: 6..20 }

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
        render 'new'
    end

    def create
        @user = User.create(user_params)       
        if @user.save 
            session[:user_id] = @user.id                                                                                                        
            flash[:success] = "Welcome to Flight Scheduler!"
            redirect_to @user
        else
            render 'new'
        end
    end


    def show
        @user = User.find_by(id: params[:id])
    end
   
    
 
    

private

    def user_params
        params.require(:user).permit(:username,:password,:admin)
    end



end