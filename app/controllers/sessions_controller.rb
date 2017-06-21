class SessionsController < ApplicationController
  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to users_path
      else
        flash[:error] = 'Password invalid'
        render 'new'
        
      end
      else
      flash[:error] = 'User not found'
      render 'new'
    end
  end
  
  def new
  end
end
