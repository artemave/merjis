class ServerLogsController < ApplicationController
  # GET /server_logs
  # GET /server_logs.xml
  def index
    @server_logs = ServerLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @server_logs }
    end
  end

  # GET /server_logs/1
  # GET /server_logs/1.xml
  def show
    @server_log = ServerLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @server_log }
    end
  end

  # GET /server_logs/new
  # GET /server_logs/new.xml
  def new
    @server_log = ServerLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @server_log }
    end
  end

  # GET /server_logs/1/edit
  def edit
    @server_log = ServerLog.find(params[:id])
  end

  # POST /server_logs
  # POST /server_logs.xml
  def create
    @server_log = ServerLog.new(params[:server_log])

    respond_to do |format|
      if @server_log.save
        format.html { redirect_to(@server_log, :notice => 'Server log was successfully created.') }
        format.xml  { render :xml => @server_log, :status => :created, :location => @server_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @server_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /server_logs/1
  # PUT /server_logs/1.xml
  def update
    @server_log = ServerLog.find(params[:id])

    respond_to do |format|
      if @server_log.update_attributes(params[:server_log])
        format.html { redirect_to(@server_log, :notice => 'Server log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @server_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /server_logs/1
  # DELETE /server_logs/1.xml
  def destroy
    @server_log = ServerLog.find(params[:id])
    @server_log.destroy

    respond_to do |format|
      format.html { redirect_to(server_logs_url) }
      format.xml  { head :ok }
    end
  end
end
