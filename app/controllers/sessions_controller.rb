class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(uname: params[:uname]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "WELCOME BACK!"
      redirect_to "/"
    else
     flash[:notice] = "Incorrect Login Info."
     redirect_to new_session_path
   end
 end

   def destroy
     session[:user_id] = nil
     flash[:notice] = "You have been logged out."
     redirect_to "/"
 end

end
