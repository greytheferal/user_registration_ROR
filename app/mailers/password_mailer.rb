class PasswordMailer < ApplicationMailer

    def reset
        params[:user]
        @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

        mail to: params[:user].email
    end
end