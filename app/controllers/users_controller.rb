class UsersController < ApplicationController

def index
  @users = User.all
end

def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
end

# handles sessions

def create
  @user = User.new(
    fname: params[:user][:fname],
    lname: params[:user][:lname],
    uname: params[:user][:uname],
    email: params[:user][:email],
    password: params[:user][:password],
    city: params[:user][:city],
    occupation: params[:user][:occupation],
  )
  session[:current_user_id] = @user.id
  if @user.save
    flash[:notice] = "Welcome to Rails Blog"
    redirect_to "/"
  else
    flash[:alert] = "Something went wrong. Please try again"
    redirect_to new_user_path
  end
end

def show
  @user = User.find(session[:user_id])
  @posts = @user.posts
end

def edit
  @user = User.find(params[:id])
end




def update
  @user = User.find(params[:id])
  @user.fname = params[:user][:fname]
  @user.lname = params[:user][:lname]

  if @user.save
  flash[:notice] = "Your profile has been updated."
  redirect_to user_path(@user)
else
  flash[:alert] = "Could not update your profile."
  redirect_to edit_user_path(@user)
  end
end

# deleting user

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Bye"
      session[:user_id] = nil
    else
      flash[:alert] = "Not able to delete your profile. Please try again."
    end
      redirect "/"
  end

end
