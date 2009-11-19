class Manage::NominationsController < ApplicationController

  before_filter :get_contest_categories, :only => [:new, :edit]
  before_filter :get_account_pictures, :only => [:new, :edit]
  
  # GET /nominations
  # GET /nominations.xml
  def index
    #@nominations = Nomination.all
    @nominations = current_account.nominations

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nominations }
    end
  end

  # GET /nominations/1
  # GET /nominations/1.xml
  def show
    @nomination = Nomination.find(params[:id])
    unless authorized?
      redirect_to(:action => :index)
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nomination }
    end
  end

  # GET /nominations/new
  # GET /nominations/new.xml
  def new
    @nomination = Nomination.new    

    load_given_contest_category

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nomination }
    end
  end

  # GET /nominations/1/edit
  def edit
    @nomination = Nomination.find(params[:id])
    redirect_to(:index) unless authorized?
  end

  # POST /nominations
  # POST /nominations.xml
  def create
    @nomination = Nomination.new(params[:nomination])
    @nomination.nominator_id = current_account_id
    
    picture = Picture.find(params[:picture][:id])
    contest_category = ContestCategory.find(params[:contest_category][:id])

    @nomination.picture = picture
    @nomination.contest_category = contest_category

    respond_to do |format|
      if @nomination.save
        flash[:notice] = 'Nomination was successfully created.'
        format.html { redirect_to(@nomination) }
        format.xml  { render :xml => @nomination, :status => :created, :location => @nomination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nominations/1
  # PUT /nominations/1.xml
  def update
    @nomination = Nomination.find(params[:id])
    redirect_to(:index) unless authorized?

    picture = Picture.find(params[:picture][:id])
    contest_category = ContestCategory.find(params[:contest_category][:id])

    @nomination.picture = picture unless @nomination.picture_id == picture.id
    @nomination.contest_category = contest_category unless @nomination.contest_category_id == contest_category.id

    respond_to do |format|
      if @nomination.update_attributes(params[:nomination])
        flash[:notice] = 'Nomination was successfully updated.'
        format.html { redirect_to(@nomination) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.xml
  def destroy
    @nomination = Nomination.find(params[:id])

    redirect_to(:index) unless authorized?

    @nomination.destroy

    respond_to do |format|
      format.html { redirect_to(nominations_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def authorized?
    ((!@nomination.nominator_id.nil?) and
      ( (@nomination.nominator_id == current_account_id) or
        ((!@nomination.picture.nil?) and @nomination.picture.account_id == current_account_id) ))
  end

  def load_given_contest_category
    contest = Contest.find params[:contest_id] if params[:contest_id]
    category = Category.find params[:category_id] if params[:category_id]

    if contest and category
      contest_category = ContestCategory.find :first, :conditions => ['contest_id = ? AND category_id = ?', contest.id, category.id]
      @nomination.contest_category = contest_category if contest_category
    end    
  end

  def get_contest_categories
    @contest_categories = ContestCategory.all_active
  end
  def get_account_pictures
    @pictures = current_account.pictures 
  end
end
