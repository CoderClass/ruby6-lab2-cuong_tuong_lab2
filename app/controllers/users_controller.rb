class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Create account successful"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Error #{@user.errors.full_messages.to_sentence}"
      render 'new'
    end

  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def index
    @users = User.all.shuffle
  end
end
