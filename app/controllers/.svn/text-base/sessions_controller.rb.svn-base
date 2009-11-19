class SessionsController < ApplicationController

  def new    
  end
  
  def create
    user = User.validate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:notice] = 'Username or Password invalid'
      redirect_to login_path
    end
  end
  
  def destroy
    reset_session
    redirect_to login_path
  end
  
end
