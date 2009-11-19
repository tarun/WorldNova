# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  before_filter :current_account

#  # Active Scaffold Settings
#  ActiveScaffold.set_defaults do |config|
#    config.ignore_columns.add [:created_at, :updated_at]
#  end

  protected

  # User and Account Details
  def current_user
    @logged_in_user ||= ((session[:user_id].blank?) ? nil : User.find_by_id(session[:user_id]))
  end
  def current_account_id
    @logged_in_account_id ||= (current_user) ? current_user.account_id : nil
  end
  def current_account
    @logged_in_account ||= (current_user) ? current_user.account : nil
  end

  # Get Contest Instance
  def get_contest
    @contest = Contest.find params[:contest_id] if params[:contest_id]
  end
  # Get Category Instance
  def get_category
    @category = Category.find params[:category_id] if params[:category_id]
  end
end
