class UsersController < ApplicationController
    
    def authenticate
        user = User.find_by_email(params[:email])
        if user.valid_password?(params[:password])
            render json: { auth_token: user.auth_token}
        end
    end
        
    def invite_friend
     to_email = params[:email]
     from_email = current_user.email
     UserMailer.create_invite(from_email, to_email, Time.now).deliver_now
    end
end
