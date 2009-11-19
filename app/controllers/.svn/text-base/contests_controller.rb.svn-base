class ContestsController < ApplicationController
  before_filter :get_contest
  before_filter :get_category

  # All Contests homepage
  def index
    @contests = Contest.all_running
  end

  # Specific contest view page
  def show
    #@contest = Contest.find(params[:contest_id])
    unless @category
      @categories = @contest.categories
    else
      @categories = [@category]
    end
    
  end

  def categories
    @categories = Category.all
  end

end
