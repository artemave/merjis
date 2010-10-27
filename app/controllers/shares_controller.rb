class SharesController < ApplicationController
  resources_controller_for :shares
  load_and_authorize_resource

  def new
    @share = Share.new
    @users = User.where(:id.not_eq => current_user.id).all
  end

  def create
    @share = Share.new(params[:share])
    @share.owner = current_user
    @share.resource = enclosing_resource

    if @share.save
      flash[:notice] = "Share created"
      redirect_to send("#{enclosing_resource_name}_shares_path", enclosing_resource)
    else
      render :action => :new
    end
  end

  private
    def find_resources
      @shares = Share.accessible_by(current_ability).all
    end

    def find_resource
      @share = Share.accessible_by(current_ability).find(params[:id])
    end
end
