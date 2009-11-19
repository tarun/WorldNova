class MainController < ApplicationController
  def index
    @user = current_user
    redirect_to :controller => 'pictures', :action => 'index'
  end

  def about

  end

  def contact
    
  end

  def help
    
  end

end
