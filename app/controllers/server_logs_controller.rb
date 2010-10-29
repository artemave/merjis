class ServerLogsController < ApplicationController
  resources_controller_for :server_logs, :in => :website
  load_and_authorize_resource :through => :website

  def create
    @website.server_logs.create(params[:server_log])
    render :js => "location.reload()"
  end

  private
    def find_resources
      @website = Website.accessible_by(current_ability).find(params[:website_id])
      @server_logs = @website.server_logs
    end
end
