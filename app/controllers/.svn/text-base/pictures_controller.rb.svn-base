class PicturesController < ApplicationController

  before_filter :get_contest
  before_filter :get_category

  def index
    @pictures = Picture.all_paginated(params[:page])
  end
  
  def show
    if @contest and @category
      contest_category = @contest.contest_categories.find_by_category_id(@category.id)
      @pictures = contest_category.nominated_pictures
    elsif @contest
      @pictures = @contest.nominated_pictures
    elsif @category
      @pictures = @category.nominated_pictures
    else
      @pictures = [Picture.find(params[:id])]
      @rating = @pictures[0].ratings.find_by_account_id(current_account_id) if current_user
    end

    @pictures = @pictures.paginate :page => params[:page], :per_page => 1
    
    unless @rating
      @rating = Rating.new
      #@rating.picture_id = @picture.id
    end
  end
end
