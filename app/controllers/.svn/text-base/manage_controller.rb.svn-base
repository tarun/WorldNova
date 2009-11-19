class ManageController < ApplicationController

  def index
    if current_account.nil?
      flash[:notice] = 'Please login to manage your account'
      redirect_to(:login)
    end
  end
  
  # Landing for Registration
  def signup
    @user = User.new
    @account = Account.new
  end

  # Form Processing
  def register
    @user = User.new(params[:user])
    @account = Account.new(params[:account])
    @user.account = @account

    if @account.save && @user.save      
      session[:user_id] = @user.id
      redirect_to home_path
    else
      @account.destroy unless @user.new_record?
      @user.destroy unless @account.new_record?
      render :action => 'signup'
    end
  end
end
