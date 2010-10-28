class ServerLogsController < ApplicationController
  resources_controller_for :server_logs, :in => :website
  load_and_authorize_resource

  def create
    @server_log = @website.server_logs.build(params[:server_log])

    if @server_log.save
      flash[:notice] = "Server log uploaded"
      redirect_to website_server_logs_path(@website)
    else
      render :action => :new
    end
  end

  private
    def find_resources
      @website = Website.accessible_by(current_ability).find(params[:website_id])
      @server_logs = @website.server_logs
    end
end
