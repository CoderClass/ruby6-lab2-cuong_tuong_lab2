class SessionsController < ApplicationController
  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'login successful'
        redirect_to root_path
      else
        flash[:error] = 'Password invalid'
        render 'new'
        
      end
      else
      flash[:error] = 'User not found'
      render 'new'
    end
  end

  def destroy
    flash[:success] = 'logout successful'
    session.delete(:user_id)
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def new
  end
end
