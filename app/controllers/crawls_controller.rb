class CrawlsController < ApplicationController
  # GET /crawl_results
  # GET /crawl_results.xml
  def index
    @crawl_results = Crawl.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @crawl_results }
    end
  end

  # GET /crawl_results/1
  # GET /crawl_results/1.xml
  def show
    @crawl_result = Crawl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crawl_result }
    end
  end

  # GET /crawl_results/new
  # GET /crawl_results/new.xml
  def new
    @crawl_result = Crawl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crawl_result }
    end
  end

  # GET /crawl_results/1/edit
  def edit
    @crawl_result = Crawl.find(params[:id])
  end

  # POST /crawl_results
  # POST /crawl_results.xml
  def create
    @crawl_result = Crawl.new(params[:crawl_result])

    respond_to do |format|
      if @crawl_result.save
        format.html { redirect_to(@crawl_result, :notice => 'Crawl result was successfully created.') }
        format.xml  { render :xml => @crawl_result, :status => :created, :location => @crawl_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crawl_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crawl_results/1
  # PUT /crawl_results/1.xml
  def update
    @crawl_result = Crawl.find(params[:id])

    respond_to do |format|
      if @crawl_result.update_attributes(params[:crawl_result])
        format.html { redirect_to(@crawl_result, :notice => 'Crawl result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crawl_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crawl_results/1
  # DELETE /crawl_results/1.xml
  def destroy
    @crawl_result = Crawl.find(params[:id])
    @crawl_result.destroy

    respond_to do |format|
      format.html { redirect_to(crawl_results_url) }
      format.xml  { head :ok }
    end
  end
end
