class RegistrationsController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #don't use cookies , anyone can do that . rails session is encrypted . safer , server side , not for browser 

            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"
        else
            #flash[:alert] = "Something was wrong"
            render :new, status: :bad_request
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end