class SessionsController < ApplicationController
    # user shouldn't have to be logged in before logging in!
    skip_before_action :set_current_user, :require_user
    
    def create
        auth = request.env["omniauth.auth"]
        user = Moviegoer.find_by(:provider => auth["provider"], :uid => auth["uid"]) ||
            Moviegoer.create_with_omniauth(auth)
        session[:user_id] = user.id
        redirect_to movies_path
    end
    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Logged out successfully.'
        redirect_to movies_path
    end
    def failure
        flash[:notice] = "User don't accept authenticate"
        redirect_to movies_path
    end
end
