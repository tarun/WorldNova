class Manage::RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.xml
  def index
    #@ratings = Rating.all
    @ratings = current_account.ratings

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.xml
  def show
    @rating = Rating.find(params[:id])
    unless authorized?
      redirect_to(:action => :index)
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.xml
  def new
    @rating = Rating.new
    @rating.image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
    redirect_to(:index) unless authorized?
  end

  # POST /ratings
  # POST /ratings.xml
  def create
    @rating = Rating.new(params[:rating])
    @rating.account_id = current_account_id

    respond_to do |format|
      if @rating.save
        flash[:notice] = 'Rating was successfully created.'
        format.html { redirect_to(@rating) }
        format.xml  { render :xml => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.xml
  def update
    @rating = Rating.find(params[:id])
    redirect_to(:index) unless authorized?

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        flash[:notice] = 'Rating was successfully updated.'
        format.html { redirect_to(@rating) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.xml
  def destroy
    @rating = Rating.find(params[:id])

    redirect_to(:index) unless authorized?

    @rating.destroy

    respond_to do |format|
      format.html { redirect_to(ratings_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def authorized?
    (!@rating.account_id.nil?) and (@rating.account_id == current_account_id)
  end
  
end
