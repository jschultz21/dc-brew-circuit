class SessionsController < ApplicationController

  def new
    @user = User.new
end


def create
     input_email = params[:user][:email]
     if User.exists?(email: input_email)
       @user = User.find_by(email: input_email)
       if @user.password === params[:user][:password]
         flash[:alert] = "You're signed in!"
         session[:user_id] = @user.id
         redirect_to root_path
       else
         flash[:alert] =  "Wrong password!"
         redirect_to new_session_path
       end
     else
       flash[:alert] = "Nonexistant user, please sign up!"
       redirect_to new_session_path
     end
   end

   def destroy
     reset_session
     redirect_to root_path
   end

end
