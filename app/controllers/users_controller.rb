class UsersController < ApplicationController

    def new
        @user=User.new
    end

    def create
        @user = User.new user_params 
        if @user.save
            session[:user_id]=@user.id
            redirect_to root_path, notice: "Logged in"
        else
        render :new
        end
    end

    def update
        @user = User.find params[:id]
        if @user.update params.require(:user).permit(:first_name, :last_name, :email, :password)
            redirect_to user_path(@user)
        else
            render :edit    
        end
    
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end



end
