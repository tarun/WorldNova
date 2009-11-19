class Admin::CategoriesController < ApplicationController

  # Test Ajax responses for nested resources.

  before_filter :get_contest
  
  # GET /categories
  # GET /categories.xml
  def index
    @categories = (@contest) ? @contest.categories : Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => [@contest, @categories] }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => [@contest, @category] }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => [@contest, @category] }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    
    
    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'

        # Adding this category to contest
        if @contest
          if @contest.categories << @category
            flash[:notice] = 'Category successfully added to contest.'
          else
            flash[:warning] = 'Category not added'
          end
        end
        
        format.html { redirect_to([@contest, @category]) }
        format.xml  { render :xml => @category, :status => :created, :location => [@contest, @category] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to([@contest, @category]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    if @contest
      @contest.categories.delete(@category)
      @category.destroy if @category.contests.empty?  # delete only if no other contest has this category
    else
      @category.destroy
    end   

    respond_to do |format|
      format.html { redirect_to((@contest) ? contest_categories_path(@contest) : categories_path) }
      format.xml  { head :ok }
    end
  end

  protected
  # Get Contest Instance
  def get_contest
    @contest = Contest.find params[:contest_id] if params[:contest_id]
  end
end
