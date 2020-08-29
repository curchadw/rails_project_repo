class UsersController < ApplicationController
 

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
            redirect_to @user
        else
            render 'new'
        end
    end


    def show
        @user = User.find_by(id: params[:id])
    end


    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to users_path
    end
   
    
 
    

private

    def user_params
        params.require(:user).permit(:username,:password,:admin)
    end



end